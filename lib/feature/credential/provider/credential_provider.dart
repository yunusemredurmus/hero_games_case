import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hero_games_case/core/utils/app_user_manager.dart';
import 'package:hero_games_case/core/utils/base_provider.dart';
import 'package:hero_games_case/feature/credential/dto/user_dto.dart';

class CredentialProvider extends BaseProvider {
  //*Register Form Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  DateTime? birthDate;

  //*Login Form Controllers
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;
    if (email.isEmpty ||
        password.isEmpty ||
        nameController.text.isEmpty ||
        surnameController.text.isEmpty ||
        bioController.text.isEmpty) {
      const snackbar = SnackBar(content: Text('Please fill all fields'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return;
    }
    setLoading(true);
    try {
      final UserCredential? userCredential =
          await UserDto.signUpWithEmailAndPassword(email, password);
      if (userCredential != null) {
        final user = UserDto(
          id: FirebaseAuth.instance.currentUser?.uid,
          email: email,
          password: password,
          birthDate: birthDate,
          biography: bioController.text,
          name: nameController.text,
          surname: surnameController.text,
        );
        AppUserManager().user = user;
        await UserDto.saveUserToDatabase(user);
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      setLoading(false);
    }
  }

  void login(BuildContext context) async {
    final email = loginEmailController.text;
    final password = loginPasswordController.text;
    if (email.isEmpty || password.isEmpty) {
      const snackbar = SnackBar(content: Text('Please fill all fields'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return;
    }
    setLoading(true);
    try {
      final UserCredential? userCredential =
          await UserDto.signInWithEmailAndPassword(email, password);
      if (userCredential != null) {
        AppUserManager().user = await UserDto.getCurrentUser();
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      setLoading(false);
    }
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: birthDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime(2000),
    );
    if (picked != null && picked != birthDate) {
      birthDate = picked;

      notifyListeners();
    }
  }
}
