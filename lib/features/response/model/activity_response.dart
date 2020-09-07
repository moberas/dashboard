import 'package:moberas_dashboard/features/activities/models/activity.dart';
import 'package:moberas_dashboard/features/response/model/response.dart';

class ActivityResponse {
  final String id;
  final Activity activity;
  final Response response;

  ActivityResponse({this.id, this.activity, this.response});

  factory ActivityResponse.fromJson(Map<String, dynamic> data, String id) {
    if (data == null) return null;
    try {
      return ActivityResponse(
        id: id,
        activity: Activity.fromJson(data['activity'], data['activity']['id']) ??
            Activity(),
        response: Response.fromJson(data['response']) ?? Response(),
      );
    } catch (e) {
      print(e);
      return ActivityResponse();
    }
  }
}
