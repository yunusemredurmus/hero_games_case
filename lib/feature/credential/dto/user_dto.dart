// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hero_games_case/core/utils/app_user_manager.dart';

import 'package:hero_games_case/feature/credential/services/auth_services.dart';
import 'package:hero_games_case/feature/credential/services/i_auth_service.dart';

class UserDto {
  final String? id;
  final String email;
  final String password;
  final DateTime? birthDate;
  final String? biography;
  final String name;
  final String surname;

  UserDto({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    this.birthDate,
    this.biography,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': FirebaseAuth.instance.currentUser?.uid,
      'email': email,
      'password': password,
      'birthDate': birthDate?.millisecondsSinceEpoch,
      'biography': biography,
      'name': name,
      'surname': surname,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      birthDate: map['birthDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int)
          : null,
      biography: map['biography'] != null ? map['biography'] as String : null,
      name: map['name'] as String,
      surname: map['surname'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) =>
      UserDto.fromMap(json.decode(source) as Map<String, dynamic>);

  static IAuthService get _authService => AuthService();

  static Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    return _authService.signUpWithEmailAndPassword(email, password);
  }

  static Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    return _authService.signInWithEmailAndPassword(email, password);
  }

  static Future<void> signOut() async {
    AppUserManager().user = null;
    _authService.signOut();
  }

  static Future<void> saveUserToDatabase(UserDto user) async {
    _authService.saveUserToDatabase(user);
  }

  static Future<UserDto?> getCurrentUser() async {
    return _authService.getCurrentUser();
  }
}
