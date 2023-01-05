import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tercer_ojo_mobile/nivel1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tercer Ojo Mobile - El Juego',
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 20,
            ),
          ),
          colorScheme: const ColorScheme.dark(
            primary: Colors.green,
            onPrimary: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.black),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo3erojo.jpg"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                HapticFeedback.lightImpact();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Nivel1()),
                );
              },
              child: const Text("Empezar"),
            ),
          ],
        ),
      ),
    );
  }
}

class Conditional extends StatelessWidget {
  final bool condition;
  final Widget Function() ifTrue;
  final Widget Function() ifFalse;

  const Conditional({
    super.key,
    required this.condition,
    required this.ifTrue,
    required this.ifFalse,
  });

  @override
  Widget build(BuildContext context) {
    return condition ? ifTrue() : ifFalse();
  }
}

class LevelWidget extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String text;
  final String levelType;
  final Widget nextLevel;
  final void Function(String)? onInputChanged;
  final double? squareBottom;
  final double? squareRight;
  final String? correctAnswer;

  const LevelWidget.click({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.text,
    this.levelType = 'click',
    required this.nextLevel,
    this.squareRight,
    this.squareBottom,
  })  : onInputChanged = null,
        correctAnswer = null;

  const LevelWidget.input({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.text,
    this.levelType = 'input',
    required this.nextLevel,
    required this.correctAnswer,
    this.onInputChanged,
  })  : squareBottom = null,
        squareRight = null;

  @override
  LevelWidgetState createState() => LevelWidgetState();
}

class LevelWidgetState extends State<LevelWidget> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Image.network(widget.imageUrl),
                    if (widget.levelType == "click")
                      Positioned(
                        right: widget.squareRight,
                        bottom: widget.squareBottom,
                        child: GestureDetector(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => widget.nextLevel,
                              ),
                            );
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.text),
              ),
              if (widget.levelType == "input")
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _textController,
                    onSubmitted: (input) {
                      if (input.trim() == widget.correctAnswer) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widget.nextLevel),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Escribe la respuesta',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
