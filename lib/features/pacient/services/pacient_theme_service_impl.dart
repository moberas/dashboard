import 'package:injectable/injectable.dart';
import 'package:moberas_dashboard/database/firestore.dart';
import 'package:moberas_dashboard/features/pacient/models/theme_cfg.dart';

import 'pacient_theme_service_interface.dart';

@Singleton(as: IPacientThemeInterface)
class PacientThemeServiceImpl implements IPacientThemeInterface {
  @override
  Future<void> updateTheme(ThemeCfg themeCfg) async {
    await UserThemeData().updateTheme(themeCfg);
  }
}
