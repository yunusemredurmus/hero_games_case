import 'package:flutter/material.dart';
import 'package:hero_games_case/screens/widgets/app_text_field.dart';
import 'package:hero_games_case/screens/widgets/button_style.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          hintText: "Username",
          controller: TextEditingController(),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        AppTextField(
          hintText: "Password",
          controller: TextEditingController(),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonforSplash(
              text: "Login",
              onPressed: () => Navigator.pushNamed(context, '/home'),
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
    );
  }
}
