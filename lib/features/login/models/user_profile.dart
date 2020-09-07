import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';

class UserProfile {
  static const String CollectionPath = 'users-moberas';

  final String displayName;
  final String email;
  final String username;

  final GeoPoint loginLocation;
  final bool online;
  final int score;
  final String uid;
  final String cpf;

  UserProfile({
    this.displayName,
    this.email,
    this.username,
    this.loginLocation,
    this.online,
    this.score,
    this.uid,
    this.cpf,
  });

  factory UserProfile.fromData(Map<String, dynamic> data) {
    if (data == null) return null;
    try {
      return UserProfile(
          displayName: data['displayName'] ?? '',
          email: data['email'] ?? '',
          username: data['username'] ?? '',
          loginLocation: data['loginLocation'] ?? GeoPoint(12.0000, 11.000),
          online: data['online'] ?? false,
          score: data['score'] ?? 0,
          cpf: data['cpf'] ?? '111',
          uid: data['uid']);
    } catch (e) {
      Logger('UserProfile').severe('Erro fromData', e);
      return null;
    }
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      'displayName': displayName ?? displayName,
      'email': email ?? email,
      'username': username ?? username,
    };
  }

  @override
  String toString() {
    return 'Name: ' +
        displayName +
        '\n' +
        'Email: ' +
        email +
        '\n' +
        'Username: ' +
        username +
        '\n';
  }
}
