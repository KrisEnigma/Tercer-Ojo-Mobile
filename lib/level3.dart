import 'package:flutter/material.dart';
import 'package:tercer_ojo_mobile/level1.dart';
import 'package:tercer_ojo_mobile/levelbase.dart';

const int level = 3;
const String title = "El código fuente puede ayudarte";
const String image = "https://www.tercerojo.net/asdf/iluminame.jpg";
const String text = "Haz lo que mi nombre te dice.";
const String correctAnswer = 'teveo';

class Nivel3 extends StatelessWidget {
  const Nivel3({super.key});

  @override
  Widget build(BuildContext context) {
    return const LevelWidget.input(
      sourceCode: SourceCode(),
      title: title,
      image: image,
      text: text,
      correctAnswer: correctAnswer,
      nextLevel: Nivel1(),
    );
  }
}

class SourceCode extends StatelessWidget {
  const SourceCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Código Fuente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(title),
            Text(image),
            Text(text),
          ],
        ),
      ),
    );
  }
}
