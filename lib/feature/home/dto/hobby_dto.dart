// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hero_games_case/core/utils/app_user_manager.dart';
import 'package:hero_games_case/feature/home/services/hobby_service.dart';
import 'package:hero_games_case/feature/home/services/i_hobby_service.dart';

class HobbyDto {
  final String id;
  final DateTime? createdAt;
  final String title;

  HobbyDto({
    required this.id,
    required this.title,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': AppUserManager().user?.id,
      'createdAt': createdAt ?? DateTime.now().millisecondsSinceEpoch,
      'title': title,
    };
  }

  factory HobbyDto.fromMap(Map<String, dynamic> map) {
    return HobbyDto(
      id: map['id'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HobbyDto.fromJson(String source) =>
      HobbyDto.fromMap(json.decode(source) as Map<String, dynamic>);

  static IHobbyService get _hobbyService => HobbyService();

  Future<void> addHobby() async {
    await _hobbyService.addHobby(this);
  }

  Future<void> deleteHobby() async {
    await _hobbyService.deleteHobby(this);
  }

  static Future<List<HobbyDto>> getHobbies() async {
    return await _hobbyService.getHobbies();
  }
}
