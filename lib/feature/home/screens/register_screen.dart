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
        title: const Text('Register Form'),
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
                      labelText: "Biography...",
                      maxLines: 2,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent[200],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: List.from([
                          const BoxShadow(
                            color: Colors.black,
                            blurRadius: 4,
                            spreadRadius: 0.1,
                            offset: Offset(0, 2),
                          ),
                        ], growable: true),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            provider.birthDate == null
                                ? 'YY-MM-DD'
                                : 'Birth Date: ${provider.birthDate!.year}-${provider.birthDate!.month}-${provider.birthDate!.day}',
                            style: const TextStyle(
                                fontSize: 22, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () => provider.selectDate(context),
                            icon: const Icon(Icons.calendar_today),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 4,
                          shadowColor: Colors.black,
                        ),
                        onPressed: () => provider.register(context),
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
