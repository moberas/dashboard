import 'package:json_annotation/json_annotation.dart';

part 'theme_cfg.g.dart';

@JsonSerializable()
class ThemeCfg {
  @JsonKey(fromJson: _doubleFromString)
  final double bodyText1Size;
  @JsonKey(fromJson: _doubleFromString)
  final double bodyText2Size;
  @JsonKey(fromJson: _doubleFromString)
  final double headline1Size;
  @JsonKey(fromJson: _doubleFromString)
  final double headline2Size;
  @JsonKey(fromJson: _doubleFromString)
  final double headline3Size;
  @JsonKey(fromJson: _doubleFromString)
  final double headline4Size;
  @JsonKey(fromJson: _doubleFromString)
  final double headline5;
  @JsonKey(fromJson: _doubleFromString)
  final double headline6Size;
  @JsonKey(fromJson: _doubleFromString)
  final double subtitle1Size;
  @JsonKey(fromJson: _doubleFromString)
  final double subtitle2Size;
  @JsonKey(fromJson: _doubleFromString)
  final double buttonSize;
  @JsonKey(fromJson: _doubleFromString)
  final double captionSize;
  @JsonKey(fromJson: _doubleFromString)
  final double overlineSize;
  final String primaryColor;
  final String accentColor;
  final String textColor;
  final String buttonColor;

  static double _doubleFromString(String size) =>
      size == null ? null : double.tryParse(size);

  ThemeCfg(
      {this.bodyText1Size,
      this.bodyText2Size,
      this.headline1Size,
      this.headline2Size,
      this.headline3Size,
      this.headline4Size,
      this.headline5,
      this.headline6Size,
      this.subtitle1Size,
      this.subtitle2Size,
      this.buttonSize,
      this.captionSize,
      this.overlineSize,
      this.primaryColor,
      this.accentColor,
      this.textColor,
      this.buttonColor});

  factory ThemeCfg.fromJson(Map<String, dynamic> json) =>
      _$ThemeCfgFromJson(json);

  Map<String, String> toJson() => _$ThemeCfgToJson(this);

  factory ThemeCfg.defaultTheme() => ThemeCfg();
}
