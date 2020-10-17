import 'package:cloud_firestore/cloud_firestore.dart';
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
    Query query = Collection<UserProfile>(path: 'users').ref;
    Map<String, dynamic> filters = {};
    if (name != null && name.isNotEmpty) {
      query = query.where('displayName', isGreaterThanOrEqualTo: name);
    }
    if (cpf != null && cpf.isNotEmpty) {
      query = query.where('cpf', isEqualTo: cpf);
    }

    var snapshots = await query.getDocuments();
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
