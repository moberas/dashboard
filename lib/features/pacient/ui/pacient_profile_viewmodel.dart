import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'package:moberas_dashboard/features/login/models/user_profile.dart';
import 'package:moberas_dashboard/features/pacient/models/theme_cfg.dart';
import 'package:moberas_dashboard/features/pacient/services/pacient_service_interface.dart';
import 'package:moberas_dashboard/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../locator.dart';

class PacientProfileViewModel extends BaseViewModel {
  final _log = Logger('PacientProfileViewModel');
  final IPacientService _pacientService = locator<IPacientService>();
  ThemeCfg themeCfg;

  final NavigationService _navigationService = locator<NavigationService>();

  UserProfile selectedPacient;

  var nameController = TextEditingController();

  var cpfController = TextEditingController();

  List<UserProfile> pacients;

  Future<List<UserProfile>> findPacientByNameOrCpf() async {
    pacients = await runBusyFuture(_pacientService.findByNameOrCpf(
        nameController.text, cpfController.text));
    return pacients;
  }

  void returnToView() {
    _navigationService.navigateTo(Routes.pacientView);
  }

  Future<void> fetchPacient(String pacientUID) async =>
      selectedPacient = await _pacientService.fetchByUID(uid: pacientUID);

  ///FORM fields - INI

  final GlobalKey<FormState> _fbKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _fbKey;

  ///FORM fields - END

}
