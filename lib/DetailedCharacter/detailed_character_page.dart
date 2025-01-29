
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_task/Character/model.dart';

class DetailedCharacterPage extends StatefulWidget {
  const DetailedCharacterPage({super.key, required this.character});
  final Character character;

  @override
  State<DetailedCharacterPage> createState() => _DetailedCharacterPage();
}

class _DetailedCharacterPage extends State<DetailedCharacterPage> {
  late Character character;

  final double titleFontSize = 55;
  final double fontSize1 = 35;
  final double fontSize2 = 25;
  final double fontSize3 = 20;
  final double fontSize4 = 18;
  final double fontSize5 = 15;
  
  @override
  void initState() {
    super.initState();
    character = widget.character;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: 30),
          children:[SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 20,
            children: <Widget>[
              Row(children: [
                IconButton(
                  onPressed: _onExitButtonPressed, 
                  icon: Icon(Icons.arrow_back_sharp), iconSize: 35, color: Color.fromRGBO(180, 180, 180, 1.0),)
              ]),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                _widgetCustomText(character.getName(), character.getHouseSecondaryColor(), titleFontSize, TextAlign.center)
                ]),
              ),
              Divider(color: character.getHousePrimaryColor(), thickness: 3, indent: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      _widgetCustomText(character.getHouseName(), character.getHousePrimaryColor(), fontSize1, TextAlign.left),
                      _widgetHouseImage(character.getHouseIcon(), MediaQuery.of(context).size.width * 0.5),
                      _widgetCustomIcon(character.getGenderIcon(), MediaQuery.of(context).size.width * 0.1)
                    ],
                  ),
                ),
                Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child:_widgetCustomList(character.getAliases(), fontSize4, TextAlign.right)),
                  )
                ],
              ),
              Divider(color: character.getHousePrimaryColor(), thickness: 1, indent: 120, endIndent: 120),
              Row(
                children: [
                  Expanded(child: _widgetCustomList(character.getTitles(), fontSize3, TextAlign.center),)
                ],
              ),
              Divider(color: character.getHousePrimaryColor(), thickness: 1, indent: 120, endIndent: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(children: [
                    _widgetCustomFutureText(character.getFatherName(), character.getHousePrimaryColor(), fontSize3, TextAlign.center),
                    _widgetCustomText("PADRE", character.getHouseSecondaryColor(), fontSize5, TextAlign.left),
                  ],)
                  ),
                  Expanded(
                    child: Column(children: [
                    _widgetCustomFutureText(character.getMotherName(), character.getHousePrimaryColor(), fontSize3, TextAlign.center),
                    _widgetCustomText("MADRE", character.getHouseSecondaryColor(), fontSize5, TextAlign.left)
                  ],)
                  )
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    _widgetCustomFutureText(character.getSpouseName(), character.getHousePrimaryColor(), fontSize3, TextAlign.center),
                    _widgetCustomText("PAREJA", character.getHouseSecondaryColor(), fontSize5, TextAlign.left),
                  ],)
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                    children: [
                      _widgetCustomText(character.getBornDate(), character.getHousePrimaryColor(), fontSize4, TextAlign.center),
                      _widgetCustomText("NACIMIENTO", character.getHouseSecondaryColor(), fontSize5, TextAlign.center)
                  ],)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                     child: Column(
                    children: [
                      _widgetCustomText(character.getDiedDate(), character.getHousePrimaryColor(), fontSize4, TextAlign.center),
                      _widgetCustomText("MUERTE", character.getHouseSecondaryColor(), fontSize5, TextAlign.center)
                  ],),
                  )
              ],),
              Divider(color: character.getHousePrimaryColor(), thickness: 1, indent: 120, endIndent: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                _widgetCustomText("ALIANZAS", character.getHousePrimaryColor(), fontSize5, TextAlign.left)
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                  child: _widgetCustomFutureList(character.getAllegiances(), fontSize4, TextAlign.center)
                ),
              ],),
              Divider(color: character.getHousePrimaryColor(), thickness: 1, indent: 120, endIndent: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                _widgetCustomText("LIBROS", character.getHousePrimaryColor(), fontSize5, TextAlign.center),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        _widgetCustomFutureList(character.getBooks(), fontSize4, TextAlign.center),
                      ],
                    )
                ),
                  Expanded(
                    child: Column(
                      children: [
                        _widgetCustomFutureList(character.getPovBooks(), fontSize4, TextAlign.center),
                      ],
                    )
                )
              ],),
              Divider(color: character.getHousePrimaryColor(), thickness: 1, indent: 120, endIndent: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                _widgetCustomText("FILMOGRAFÍA", character.getHousePrimaryColor(), fontSize5, TextAlign.center),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                  child: Column(
                    children: [
                      _widgetCustomList(character.getTvSeries(), fontSize4, TextAlign.center),
                    ],
                  )
                ),
                Expanded(
                  child: Column(
                    children: [
                      _widgetCustomList(character.getPlayedBy(), fontSize4, TextAlign.center),
                    ],
                  )
                )
              ],)         
            ],
          ),
      )]),
      )
    );
  }

//---> Custom Widgets
  Widget _widgetCustomText(String text, Color color, double size, TextAlign align) {
    return Text(
      text,
      textAlign: align,
      maxLines: 4,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: size, color: color));
  }

  Widget _widgetCustomFutureText(Future<String> text, Color color, double size, TextAlign align) {
    return FutureBuilder<String>(
      future: text,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error al cargar el padre");
        } else {
          return _widgetCustomText(snapshot.data ?? "Desconocido", color, size, align);
        }
      },
    );
  }

  Widget _widgetHouseImage(String image, double size) {
    return Image(
      image: AssetImage(image),
      width: (15 / 100) * size,
      height: (16.2855 / 100) * size);
  }

  Widget _widgetCustomIcon(IconData iconData, double size) {
    return Icon(
      iconData,
      size: (12 / 100) * 400,
      );
  }

  Widget _widgetCustomList(List<String> stringList, double fontSize, TextAlign align) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200),  // Limitar la altura del ListView
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: stringList.length,
        itemBuilder: (context, index) {
          return _widgetCustomText(stringList[index], character.getHouseSecondaryColor(), fontSize, align);
        },
      ),
    );
  }

  Widget _widgetCustomFutureList(Future<List<String>> stringList, double fontSize, TextAlign align) {
    return FutureBuilder<List<String>>(
      future: stringList,
      builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text("Error al cargar aliados");
    } else {
      return Column(
        children: snapshot.data!.map((ally) => _widgetCustomText(ally, character.getHouseSecondaryColor(), fontSize, align)).toList(),
      );
    }},
  );
  }

//---> Exit Button
  void _onExitButtonPressed() {
    Navigator.pop(context);
  }
}