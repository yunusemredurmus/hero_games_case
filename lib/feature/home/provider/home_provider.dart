import 'package:flutter/material.dart';
import 'package:hero_games_case/core/utils/app_user_manager.dart';
import 'package:hero_games_case/core/utils/base_provider.dart';
import 'package:hero_games_case/feature/home/dto/hobby_dto.dart';
import 'package:uuid/uuid.dart';

class HomeProvider extends BaseProvider {
  List<HobbyDto> hobbies = [];

  Future<void> getHobbies() async {
    hobbies = await HobbyDto.getHobbies();
    notifyListeners();
  }

  //*Hobby Form Controllers
  TextEditingController hobbyControllerText = TextEditingController();

  Future<void> addHobby(String title) async {
    title = hobbyControllerText.text;
    if (title.isEmpty) {
      return;
    }
    HobbyDto hobby = HobbyDto(
      id: const Uuid().v4(),
      title: title,
    );
    hobby.addHobby();
    hobbyControllerText.clear();
    getHobbies();
  }

  void deleteHobby(int index) async {
    hobbies[index].deleteHobby();
    getHobbies();
  }
}
