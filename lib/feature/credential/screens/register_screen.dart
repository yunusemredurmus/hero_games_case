import 'package:flutter/material.dart';
import 'package:hero_games_case/core/shared/app_scaffold.dart';
import 'package:hero_games_case/core/shared/app_text_field.dart';
import 'package:hero_games_case/feature/credential/provider/credential_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<CredentialProvider>(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Consumer<CredentialProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/register.png',
                height: 300,
                width: 300,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AppTextField(
                      controller: provider.nameController,
                      labelText: "Name ",
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      controller: provider.surnameController,
                      labelText: "Surname ",
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      controller: provider.emailController,
                      labelText: "Email",
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      controller: provider.passwordController,
                      labelText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      controller: provider.bioController,
                      labelText: "Biography",
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => provider.selectDate(context),
                      child: const Text('Doğum Tarihini Seç'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => provider.register(context),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
