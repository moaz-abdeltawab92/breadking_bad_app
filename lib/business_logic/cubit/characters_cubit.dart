import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/data/models/characters.dart';
import 'package:breaking_bad_app/data/repo/characters_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
