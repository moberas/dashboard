import 'package:moberas_dashboard/features/pacient/models/theme_cfg.dart';

abstract class IPacientThemeInterface {
  Future<void> updateTheme(ThemeCfg themeCfg);
}
