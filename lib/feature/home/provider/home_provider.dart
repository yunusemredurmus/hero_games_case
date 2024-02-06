import 'package:hero_games_case/core/utils/base_provider.dart';
import 'package:hero_games_case/feature/home/dto/hobby_dto.dart';
import 'package:uuid/uuid.dart';

class HomeProvider extends BaseProvider {
  HobbyDto hobby3 = HobbyDto(
    id: const Uuid().v4(),
    title: 'Basketbo222lll',
  );

  List<HobbyDto> hobbies = [];

  Future<void> getHobbies() async {
    hobbies = await HobbyDto.getHobbies();
    notifyListeners();

    hobbies.forEach((element) {
      print(element.title);
    });
  }

  Future<void> addHobby() async {
    hobby3.addHobby();
  }

  void deleteHobby() async {
    hobby3.deleteHobby();
  }
}
