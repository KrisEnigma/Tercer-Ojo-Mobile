import 'package:flutter/material.dart';
import 'package:tercer_ojo_mobile/level2.dart';
import 'package:tercer_ojo_mobile/levelbase.dart';

const int level = 1;
const String title = "Bienvenido";
const String image = "images/level1.jpg";
const String text = "Sigue al conejo blanco.";
String imageName = image.substring(image.lastIndexOf('/') + 1);

class Nivel1 extends StatelessWidget {
  const Nivel1({super.key});

  @override
  Widget build(BuildContext context) {
    return const LevelWidget.click(
      sourceCode: SourceCode(),
      title: title,
      image: image,
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
        title: const Text('Código Fuente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SelectableText(
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

imageFile {
$imageName
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
