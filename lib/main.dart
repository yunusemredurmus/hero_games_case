import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hero_games_case/feature/credential/provider/credential_provider.dart';
import 'package:hero_games_case/feature/home/provider/home_provider.dart';
import 'package:hero_games_case/feature/splash/provider/splash_provider.dart';
import 'package:hero_games_case/firebase_options.dart';
import 'package:hero_games_case/feature/home/screens/home_screen.dart';
import 'package:hero_games_case/feature/home/screens/register_screen.dart';
import 'package:hero_games_case/feature/splash/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => CredentialProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
