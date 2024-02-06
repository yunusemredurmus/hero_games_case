import 'package:flutter/material.dart';
import 'package:hero_games_case/core/shared/app_text_field.dart';
import 'package:hero_games_case/feature/credential/provider/credential_provider.dart';
import 'package:hero_games_case/feature/home/screens/widgets/button_style.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CredentialProvider>(
      builder: (context, provider, child) => Container(
        padding: const EdgeInsets.all(20),
        height: 400,
        width: double.infinity,
        child: Column(children: [
          const Text("Login",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent)),
          const SizedBox(height: 20),
          AppTextField(
            labelText: "Email",
            controller: provider.loginEmailController,
          ),
          const SizedBox(height: 20),
          AppTextField(
            labelText: "Password",
            controller: provider.loginPasswordController,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonforSplash(
                text: "Login",
                onPressed: () => provider.login(context),
                color: Colors.red.toString(),
              ),
              ButtonforSplash(
                  text: "Sign Up",
                  onPressed: () => Navigator.pushNamed(context, '/register')),
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgot');
              },
              child: const Text("Forgot Email?",
                  style:
                      TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
        ]),
      ),
    );
  }
}
