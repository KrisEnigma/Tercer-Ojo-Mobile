import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LevelWidget extends StatefulWidget {
  final String title;
  final String image;
  final String text;
  final String levelType;
  final Widget nextLevel;
  final void Function(String)? onInputChanged;
  final double? squareBottom;
  final double? squareRight;
  final String? correctAnswer;
  final Widget sourceCode;

  const LevelWidget.click({
    super.key,
    required this.title,
    required this.image,
    required this.text,
    this.levelType = 'click',
    required this.nextLevel,
    required this.sourceCode,
    this.squareRight,
    this.squareBottom,
  })  : onInputChanged = null,
        correctAnswer = null;

  const LevelWidget.input({
    super.key,
    required this.title,
    required this.image,
    required this.text,
    this.levelType = 'input',
    required this.nextLevel,
    required this.sourceCode,
    required this.correctAnswer,
    this.onInputChanged,
  })  : squareBottom = null,
        squareRight = null;

  @override
  LevelWidgetState createState() => LevelWidgetState();
}

class LevelWidgetState extends State<LevelWidget> {
  late TextEditingController _textController;
  String? _textFieldError;

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

  DateTime preBackpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final timegap = DateTime.now().difference(preBackpress);
        final cantExit = timegap >= const Duration(seconds: 2);
        preBackpress = DateTime.now();
        if (cantExit) {
          //show snackbar
          const snack = SnackBar(
            content: Text('Presiona Atrás de nuevo para Salir'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.title),
          actions: [
            PopupMenuButton(
                // add icon, by default "3 dot" icon
                icon: const Icon(Icons.settings),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text("Ver Código Fuente"),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Opciones"),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Salir"),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => widget.sourceCode,
                      ),
                    );
                  } else if (value == 1) {
                    print("Settings");
                  } else if (value == 2) {
                    SystemNavigator.pop();
                  }
                }),
          ],
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
                      Image.asset(
                        widget.image,
                      ),
                      const SizedBox(height: 16),
                      if (widget.levelType == 'click')
                        Positioned(
                          right: widget.squareRight,
                          bottom: widget.squareBottom,
                          child: GestureDetector(
                            onTap: () {
                              HapticFeedback.lightImpact();
                              Navigator.pushReplacement(
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
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 1,
                    child: SelectableText(widget.text),
                  ),
                ),
                if (widget.levelType == "input")
                  Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _textController,
                        onChanged: (input) {
                          setState(() {
                            _textFieldError = null;
                          });
                        },
                        onSubmitted: (input) {
                          if (input.trim() == widget.correctAnswer) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => widget.nextLevel,
                              ),
                            );
                          } else {
                            setState(() {
                              _textFieldError = 'Respuesta incorrecta';
                            });
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Escribe la respuesta',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText: _textFieldError,
                        ),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
