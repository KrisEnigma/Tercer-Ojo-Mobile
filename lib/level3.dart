import 'package:flutter/material.dart';
import 'package:tercer_ojo_mobile/main.dart';

class Level3 extends StatelessWidget {
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    return const LevelWidget.input(
      title: 'Nivel 3',
      imageUrl: 'https://example.com/image2.jpg',
      text: 'Enter the correct answer to advance to the next level',
      correctAnswer: 'answer',
      nextLevel: MainMenu(),
    );
  }
}
