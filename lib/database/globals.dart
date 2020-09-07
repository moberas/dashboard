import 'package:moberas_dashboard/features/activities/models/activity.dart';
import 'package:moberas_dashboard/features/login/models/user_profile.dart';
import 'package:moberas_dashboard/features/pacient/models/theme_cfg.dart';
import 'package:moberas_dashboard/features/response/model/activity_response.dart';
import 'package:moberas_dashboard/features/response/model/response.dart';

class Global {
  static final Map models = {
    UserProfile: (data, documentID) => UserProfile.fromData(data),
    ThemeCfg: (data, documentID) => ThemeCfg.fromJson(data),
    Activity: (data, documentID) => Activity.fromJson(data, documentID),
    ActivityResponse: (data, documentID) =>
        ActivityResponse.fromJson(data, documentID),
    Response: (data, documentID) => Response.fromJson(data),
  };
}
