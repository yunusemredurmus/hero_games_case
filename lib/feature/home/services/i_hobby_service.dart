import 'package:hero_games_case/feature/home/dto/hobby_dto.dart';

abstract class IHobbyService {
  Future<List<HobbyDto>> getHobbies();
  Future<void> addHobby(HobbyDto hobby);
  Future<void> deleteHobby(HobbyDto hobby);
}
