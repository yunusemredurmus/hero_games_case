import 'package:flutter/material.dart';
import 'package:hero_games_case/core/utils/app_user_manager.dart';
import 'package:hero_games_case/feature/credential/dto/user_dto.dart';
import 'package:hero_games_case/feature/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
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
        builder: (context, provider, child) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent,
                  boxShadow: List.from([
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
                ),
                child: Column(
                  children: [
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
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Biography: ${AppUserManager().user?.biography}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Birth Date: ${AppUserManager().user?.birthDate?.day}/${AppUserManager().user?.birthDate?.month}/${AppUserManager().user?.birthDate?.year}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _showAddHobbyDialog(context, provider);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Hobby'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      UserDto.signOut();

                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Logout'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.hobbies.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(provider.hobbies[index].title),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            provider.deleteHobby(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showAddHobbyDialog(BuildContext context, HomeProvider provider) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Hobby'),
        content: TextField(
          controller: provider.hobbyControllerText,
          decoration: const InputDecoration(labelText: 'Enter your hobby'),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              provider.addHobby(provider.hobbyControllerText.text);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
