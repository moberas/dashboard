import 'package:flutter/material.dart';
import 'package:moberas_dashboard/features/login/models/user_profile.dart';
import 'package:moberas_dashboard/features/pacient/services/pacient_service_interface.dart';
import 'package:moberas_dashboard/router/router.gr.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../locator.dart';

class PacientViewModel extends BaseViewModel {
  final _pacientService = locator<IPacientService>();

  final NavigationService _navigationService = locator<NavigationService>();

  var nameController = TextEditingController();

  var cpfController = TextEditingController();

  List<UserProfile> pacients;

  Future<void> findPacientByNameOrCpf() async {
    pacients = await runBusyFuture(_pacientService.findByNameOrCpf(
        nameController.text, cpfController.text));
  }

  void profile(UserProfile profile) {
    _navigationService.navigateTo(Routes.pacientProfileView,
        arguments: PacientProfileViewArguments(profile: profile));
  }
}
