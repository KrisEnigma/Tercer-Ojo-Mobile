import 'package:flutter/material.dart';
import 'package:tercer_ojo_mobile/main.dart';
import 'package:tercer_ojo_mobile/level2.dart';

class Nivel1 extends StatelessWidget {
  const Nivel1({super.key});

  @override
  Widget build(BuildContext context) {
    return const LevelWidget.click(
      title: "Bienvenido",
      imageUrl: "https://www.tercerojo.net/asdf/level1.jpg",
      text: "Sigue al conejo blanco.",
      nextLevel: Nivel2(),
      squareBottom: 100,
      squareRight: 35,
    );
  }
}
