import 'package:breaking_bad_app/constants/colors.dart';
import 'package:breaking_bad_app/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          color: AppColors.grey,
          child: character.image!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: "assets/images/Animation-.gif",
                  image: character.image!,
                  fit: BoxFit.cover,
                )
              : Image.asset("assets/images/download.png"),
        ),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            "${character.name}",
            style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
