import 'dart:ui';

class House {
  String icon;
  Color primaryColor;
  Color secondaryColor;

  House(this.icon, this.primaryColor, this.secondaryColor);
}
Map<String, House> housesMap = {
  "None": House(
      "assets/icons/32px-None.png",
      const Color.fromRGBO(255, 255, 255, 1),
      const Color.fromRGBO(200, 200, 200, 1)),
  "Arryn": House(
      "assets/icons/32px-House_Arryn.png",
      const Color.fromRGBO(220, 220, 230, 1),
      const Color.fromRGBO(0, 110, 190, 1)),
  "Baratheon": House(
      "assets/icons/32px-House_Baratheon.png",
      const Color.fromRGBO(26, 27, 32, 1),
      const Color.fromRGBO(235, 190, 50, 1)),
  "Greyjoy": House(
      "assets/icons/32px-House_Greyjoy.png",
      const Color.fromRGBO(230, 190, 50, 1),
      const Color.fromRGBO(20, 20, 25, 1)),
  "Lannister": House(
      "assets/icons/32px-House_Lannister.png",
      const Color.fromRGBO(240, 180, 55, 1),
      const Color.fromRGBO(170, 15, 30, 1)),
  "Martell": House(
      "assets/icons/32px-House_Martell.png",
      const Color.fromRGBO(210, 45, 50, 1),
      const Color.fromRGBO(225, 110, 40, 1)),
  "Stark": House(
      "assets/icons/32px-House_Stark.png",
      const Color.fromRGBO(125, 125, 125, 1),
      const Color.fromRGBO(235, 235, 235, 1)),
  "Targaryen": House(
      "assets/icons/32px-House_Targaryen.png",
      const Color.fromRGBO(160, 30, 35, 1),
      const Color.fromRGBO(10, 10, 10, 1)),
  "Tully": House(
      "assets/icons/32px-House_Tully.png",
      const Color.fromRGBO(195, 195, 195, 1),
      const Color.fromRGBO(0, 40, 160, 1)),
  "Tyrell": House(
      "assets/icons/32px-House_Tyrell.png",
      const Color.fromRGBO(235, 230, 130, 1),
      const Color.fromRGBO(0, 110, 30, 1)),
  "Hightower": House(
      "assets/icons/32px-House_Hightower.png",
      const Color.fromRGBO(220, 220, 220, 1),
      const Color.fromRGBO(250, 110, 50, 1))
};

// Map<String, House> housesMap = {
//   "None": House(
//       "assets/icons/32px-None.png",
//       const Color.fromRGBO(255, 255, 255, 1),
//       const Color.fromRGBO(195, 195, 195, 1)),
//   "Arryn": House(
//       "assets/icons/32px-House_Arryn.png",
//       const Color.fromRGBO(231, 231, 232, 1),
//       const Color.fromRGBO(0, 128, 210, 1)),
//   "Baratheon": House(
//       "assets/icons/32px-House_Baratheon.png",
//       const Color.fromRGBO(28, 29, 34, 1),
//       const Color.fromRGBO(245, 206, 62, 1)),
//   "Greyjoy": House(
//       "assets/icons/32px-House_Greyjoy.png",
//       const Color.fromRGBO(245, 206, 62, 1),
//       const Color.fromRGBO(28, 29, 34, 1)),
//   "Lannister": House(
//       "assets/icons/32px-House_Lannister.png",
//       const Color.fromRGBO(250, 197, 65, 1),
//       const Color.fromRGBO(199, 12, 27, 1)),
//   "Martell": House(
//       "assets/icons/32px-House_Martell.png",
//       const Color.fromRGBO(221, 49, 55, 1),
//       const Color.fromRGBO(233, 116, 42, 1)),
//   "Stark": House(
//       "assets/icons/32px-House_Stark.png",
//       const Color.fromRGBO(140, 140, 140, 1),
//       const Color.fromRGBO(241, 241, 241, 1)),
//   "Targaryen": House(
//       "assets/icons/32px-House_Targaryen.png",
//       const Color.fromRGBO(179, 34, 39, 1),
//       const Color.fromRGBO(14, 14, 14, 1)),
//   "Tully": House(
//       "assets/icons/32px-House_Tully.png",
//       const Color.fromRGBO(206, 206, 206, 1),
//       const Color.fromRGBO(0, 35, 172, 1)),
//   "Tyrell": House(
//       "assets/icons/32px-House_Tyrell.png",
//       const Color.fromRGBO(243, 240, 139, 1),
//       const Color.fromRGBO(0, 128, 37, 1)),
//   "Hightower": House(
//       "assets/icons/32px-House_Hightower.png",
//       const Color.fromRGBO(227, 227, 227, 1),
//       const Color.fromRGBO(255, 124, 57, 1))
// };
