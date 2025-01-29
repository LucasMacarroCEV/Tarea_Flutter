import 'package:flutter/material.dart';
import 'package:flutter_task/Classes/model.dart';
import 'package:flutter_task/Favorite/favorite_singelton.dart';

class CharacterContainer extends StatefulWidget {
  const CharacterContainer({super.key, required this.character, required this.size});
  final Character character;
  final double size;

  @override
  State<CharacterContainer> createState() => _CharacterContainerState();
}

class _CharacterContainerState extends State<CharacterContainer> {
  late double size;
  late Character character;
  late IconData favIcon;

  @override
  void initState(){
    size = widget.size;
    character = widget.character;
    super.initState();
  }

  void _onFavButtonPressed() {
    FavoriteSingleton.addToFavCharList(character);
    setState(() {
      favIcon = _favIcon();
    });
  }

  IconData _favIcon() {
    if (FavoriteSingleton.bInFavCharsList(character)) {
      return Icons.star;
    } else {
      return Icons.star_border_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
        onTap: () {
          print("Container clicked");
        },
        child: 
        Container(
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
                  color: Colors.grey.withAlpha(85),
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
                            onPressed: _onFavButtonPressed,
                            icon: Icon(_favIcon(), size: (12 / 100) * size)),
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

// class CharacterContainer extends StatelessWidget {
//   const CharacterContainer(
//       {super.key, required this.character, required this.size});
//   final Character character;
//   final double size;
//   late IconData favIcon;

//   void _onFavButtonPressed() {
//     FavoriteSingleton.addToFavCharList(character);
//   }

//   void _favIcon() {
//     if (FavoriteSingleton.bInFavCharsList(character)) {
//       favIcon = Icons.star;
//     } else {
//       favIcon = Icons.star_border_outlined;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//     GestureDetector(
//         onTap: () {
//           print("Container clicked");
//         },
//         child: 
//         Container(
//           width: size,
//           height: size,
//           margin:
//               const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
//           decoration: BoxDecoration(
//               color: character.getHousePrimaryColor(),
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(
//                   color: character.getHouseSecondaryColor(), width: 2.5),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withAlpha(85),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3),
//                 )
//               ]),
//           child: Padding(
//               padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                             onPressed: _onFavButtonPressed,
//                             icon: Icon(_favIcon(),
//                               size: (12 / 100) * size,
//                             )),
//                         Text(character.getNumber(),
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: (7 / 100) * size))
//                       ],
//                     ),
//                     FittedBox(
//                       fit: BoxFit.contain,
//                       child: Text(character.getName(),
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           style: TextStyle(
//                               fontSize: (12.5 / 100) * size,
//                               color: character.getHouseSecondaryColor())),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Image(
//                             image: AssetImage(character.getHouseIcon()),
//                             width: (15 / 100) * size,
//                             height: (16.2855 / 100) * size),
//                         Icon(
//                           character.getGenderIcon(),
//                           size: (12 / 100) * size,
//                         )
//                       ],
//                     )
//                   ])),
//         ));
//   }
// }


