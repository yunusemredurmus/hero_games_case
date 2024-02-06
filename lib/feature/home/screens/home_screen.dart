import 'package:flutter/material.dart';
import 'package:hero_games_case/core/utils/app_user_manager.dart';
import 'package:hero_games_case/feature/credential/dto/user_dto.dart';
import 'package:hero_games_case/feature/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getHobbies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) => Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(16),
                width: 300,

                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                // ignore: avoid_unnecessary_containers

                child: Column(
                  children: ([
                    Text(
                      "Welcome ${AppUserManager().user?.name} ${AppUserManager().user?.surname}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Email: ${AppUserManager().user?.email}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Biography: ${AppUserManager().user?.biography}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Birth Date: ${AppUserManager().user?.birthDate?.day}/${AppUserManager().user?.birthDate?.month}/${AppUserManager().user?.birthDate?.year}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      provider.addHobby();
                    },
                    child: const Icon(Icons.add),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      UserDto.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    },
                    child: const Icon(Icons.logout),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
