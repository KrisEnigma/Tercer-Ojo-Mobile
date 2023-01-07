import 'package:flutter/material.dart';
import 'package:tercer_ojo_mobile/main.dart';
import 'package:tercer_ojo_mobile/levelbase.dart';

const int level = 2;
const String title = "El código fuente puede ayudarte";
const String imageUrl = "https://www.tercerojo.net/asdf/iluminame.jpg";
const String text = "Haz lo que mi nombre te dice.";
const String correctAnswer = 'teveo';

class Nivel2 extends StatelessWidget {
  const Nivel2({super.key});

  @override
  Widget build(BuildContext context) {
    return const LevelWidget.input(
      sourceCode: SourceCode(),
      title: title,
      imageUrl: imageUrl,
      text: text,
      correctAnswer: correctAnswer,
      nextLevel: MainMenu(),
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
            Text(
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
              ),
              '''
// Título del nivel

title {
$title
}

// Nombre de la imagen

imageUrl {
${imageUrl.substring(imageUrl.lastIndexOf('/') + 1)}
}

// Texto del nivel

text {
$text
}
''',
            ),
          ],
        ),
      ),
    );
  }
}
