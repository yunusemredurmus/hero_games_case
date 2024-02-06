import 'package:flutter/material.dart';
import 'package:hero_games_case/core/shared/app_scaffold.dart';
import 'package:hero_games_case/feature/home/screens/widgets/button_style.dart';
import 'package:hero_games_case/feature/home/screens/widgets/login_form.dart';
import 'package:hero_games_case/feature/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashProvider>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold<SplashProvider>(
      body: Consumer<SplashProvider>(
        builder: (context, provider, child) => Container(
          margin: MediaQuery.of(context).padding,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              Container(
                // Başlık arkaplanı için container oluşturuldu
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange[300],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Text(
                  "Hero Games Case Study",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "In this case study, you will see the screens and functions of a user registration system made with Flutter.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Visibility(
                visible: !provider.isCurrentUser,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Buton widget'ı için ButtonforSplash widget'ı kullanıldı
                    ButtonforSplash(
                        text: "Login",
                        onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) => LoginForm())),
                    const SizedBox(width: 20),
                    ButtonforSplash(
                        text: "Sign Up",
                        onPressed: () =>
                            Navigator.pushNamed(context, '/register')),
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
