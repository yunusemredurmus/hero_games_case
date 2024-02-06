import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hero_games_case/feature/credential/dto/user_dto.dart';
import 'package:hero_games_case/feature/credential/services/i_auth_service.dart';

class AuthService implements IAuthService {
  @override
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential =
          FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> saveUserToDatabase(UserDto user) async {
    FirebaseFirestore.instance.collection('users').add(user.toMap());
  }

  @override
  Future<UserDto?> getCurrentUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return null;
      }
      final QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
          .instance
          .collection('users')
          .where('id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();

      final user = data.docs.first.data();
      return UserDto.fromMap(user);
    } catch (e) {
      return null;
    }
  }
}
