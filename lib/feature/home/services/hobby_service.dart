import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hero_games_case/core/utils/app_user_manager.dart';
import 'package:hero_games_case/feature/home/dto/hobby_dto.dart';
import 'package:hero_games_case/feature/home/services/i_hobby_service.dart';

class HobbyService implements IHobbyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addHobby(HobbyDto hobby) async {
    _firestore.collection('hobbies').doc(hobby.id).set(hobby.toMap());
  }

  @override
  Future<void> deleteHobby(HobbyDto hobby) async {
    try {
      _firestore.collection('hobbies').doc(hobby.id).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<HobbyDto>> getHobbies() async {
    final QuerySnapshot<Map<String, dynamic>> data = await _firestore
        .collection('hobbies')
        .where('userId', isEqualTo: AppUserManager().user?.id)
        .get();
    return data.docs.map((e) => HobbyDto.fromMap(e.data())).toList();
  }
}
