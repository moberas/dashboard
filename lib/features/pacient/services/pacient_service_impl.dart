import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:moberas_dashboard/database/firestore.dart';
import 'package:moberas_dashboard/features/login/models/user_profile.dart';
import 'package:moberas_dashboard/features/pacient/models/theme_cfg.dart';

import 'pacient_service_interface.dart';

@LazySingleton(as: IPacientService)
class IPacientServiceImpl extends IPacientService {
  final _log = Logger('IPacientService');
  final HttpsCallable callableMobErasPacientPush =
      CloudFunctions.instance.getHttpsCallable(
    functionName: 'pacientPush',
  );

  @override
  Future<void> changeTheme(ThemeCfg theme, String uid) {
    return null;
  }

  @override
  Future<List<UserProfile>> findByNameOrCpf(String name, String cpf) async {
    var collectionReference = Collection<UserProfile>(path: 'users').ref;
    name ??
        collectionReference.where('displayName', isGreaterThanOrEqualTo: name);
    cpf ?? collectionReference.where('cpf', isEqualTo: cpf);
    var snapshots = await collectionReference.getDocuments();
    return snapshots.documents
        .map((doc) => UserProfile.fromData(doc.data))
        .toList();
  }

  @override
  Future<List<UserProfile>> listAll() {
    return Collection<UserProfile>(path: 'users').getData();
  }

  @override
  Future<void> sendMsg(String uid, String msg) async {
    try {
      var data = {'uid': uid, 'msg': msg};
      await callableMobErasPacientPush.call(data);
    } catch (e) {
      _log.severe('sendpush', e);
    }
  }

  @override
  Future<UserProfile> fetchByUID({String uid}) async =>
      await UserProfileData().getDocument();
}
