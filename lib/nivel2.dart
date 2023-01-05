import 'package:flutter/material.dart';
import 'package:tercer_ojo_mobile/main.dart';

class Nivel2 extends StatelessWidget {
  const Nivel2({super.key});

  @override
  Widget build(BuildContext context) {
    return const LevelWidget.input(
      title: "El código fuente puede ayudarte",
      imageUrl: "https://www.tercerojo.net/asdf/iluminame.jpg",
      text: "Haz lo que mi nombre te dice.",
      nextLevel: MainMenu(),
      correctAnswer: "iluminame",
    );
  }
}
