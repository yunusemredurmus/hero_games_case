import 'package:firebase_auth/firebase_auth.dart';
import 'package:hero_games_case/feature/credential/dto/user_dto.dart';

abstract class IAuthService {
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password);
  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password);
  Future<void> signOut();
  Future<void> saveUserToDatabase(UserDto userDto);
  Future<UserDto?> getCurrentUser();
}
