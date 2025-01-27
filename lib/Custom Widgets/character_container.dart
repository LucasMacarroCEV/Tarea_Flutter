import 'package:flutter/material.dart';
import 'package:flutter_task/Classes/character.dart';

class CharacterContainer extends StatelessWidget {
  const CharacterContainer(
      {super.key, required this.character, required this.size});
  final Character character;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("Container clicked");
        },
        child: Container(
          width: size,
          height: size,
          margin:
              const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
          decoration: BoxDecoration(
              color: character.getHousePrimaryColor(),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: character.getHouseSecondaryColor(), width: 2.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.star_border_outlined,
                              size: (12 / 100) * size,
                            )),
                        Text(character.getNumber(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: (7 / 100) * size))
                      ],
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(character.getName(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: (12.5 / 100) * size,
                              color: character.getHouseSecondaryColor())),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(
                            image: AssetImage(character.getHouseIcon()),
                            width: (15 / 100) * size,
                            height: (16.2855 / 100) * size),
                        Icon(
                          character.getGenderIcon(),
                          size: (12 / 100) * size,
                        )
                      ],
                    )
                  ])),
        ));
  }
}
