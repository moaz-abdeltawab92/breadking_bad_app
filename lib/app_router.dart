import 'package:breaking_bad_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_app/data/repo/characters_repo.dart';
import 'package:breaking_bad_app/data/web_services/characters_web_services.dart';
import 'package:breaking_bad_app/presentation/screens/characters_details.dart';
import 'package:breaking_bad_app/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepo = CharactersRepo(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => CharactersCubit(
                    charactersRepo,
                  ),
                  child: const CharactersScreen(),
                ));

      case 'character_Details_Screen':
        return MaterialPageRoute(builder: (_) => const CharactersDetails());
    }
  }
}
