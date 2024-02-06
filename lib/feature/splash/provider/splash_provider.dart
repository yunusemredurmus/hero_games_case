import 'package:flutter/material.dart';
import 'package:hero_games_case/core/utils/app_user_manager.dart';
import 'package:hero_games_case/core/utils/base_provider.dart';
import 'package:hero_games_case/feature/credential/dto/user_dto.dart';

class SplashProvider extends BaseProvider {
  bool isFirst = true;
  bool isCurrentUser = true;
  Future<void> init(BuildContext context) async {
    if (!isFirst) return;

    await Future.delayed(const Duration(seconds: 2));
    try {
      AppUserManager().user = await UserDto.getCurrentUser();
      if (AppUserManager().user != null) {
        isCurrentUser = true;
        notifyListeners();

        //ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    } finally {
      isFirst = false;
      isCurrentUser = false;
      notifyListeners();
    }
  }
}
