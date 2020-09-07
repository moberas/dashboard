import 'package:flutter/material.dart';
import 'package:moberas_dashboard/features/login/models/user_profile.dart';
import 'package:moberas_dashboard/features/pacient/models/theme_cfg.dart';

abstract class IPacientService {
  Future<List<UserProfile>> listAll();
  Future<List<UserProfile>> findByNameOrCpf(String name, String cpf);
  Future<void> sendMsg(String uid, String msg);
  Future<void> changeTheme(ThemeCfg theme, String uid);
  Future<UserProfile> fetchByUID({@required String uid});
}
