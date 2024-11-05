import 'package:breaking_bad_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_app/constants/colors.dart';
import 'package:breaking_bad_app/data/models/characters.dart';
import 'package:breaking_bad_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allcharacters;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allcharacters = (state).characters;
          return buildLoadedListWidget();
        } else
          return showLoadingIndicator();
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColors.yellow,
    ));
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
        child: Container(
      color: AppColors.grey,
      child: Column(
        children: [
          buildCharactersList(),
        ],
      ),
    ));
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: allcharacters.length,
        itemBuilder: (ctx, index) {
          return CharacterItem(
            character: allcharacters[index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.yellow,
        title: const Text(
          'Characters',
          style: TextStyle(
              color: AppColors.grey, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
