import 'package:flutter/material.dart';
import 'package:tercer_ojo_mobile/level2.dart';
import 'package:tercer_ojo_mobile/levelbase.dart';

const int level = 1;
const String title = "Bienvenido";
const String imageUrl = "https://www.tercerojo.net/asdf/level1.jpg";
const String text = "Sigue al conejo blanco.";

class Nivel1 extends StatelessWidget {
  const Nivel1({super.key});

  @override
  Widget build(BuildContext context) {
    return const LevelWidget.click(
      sourceCode: SourceCode(),
      title: title,
      imageUrl: imageUrl,
      text: text,
      nextLevel: Nivel2(),
      squareBottom: 100,
      squareRight: 35,
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
        title: const Text('SourceCode'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const Text(title),
            Text(imageUrl.substring(imageUrl.lastIndexOf('/') + 1)),
            const Text(text),
          ],
        ),
      ),
    );
  }
}
