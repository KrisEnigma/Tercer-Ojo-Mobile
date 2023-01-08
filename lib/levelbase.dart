import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_gifs/loading_gifs.dart';

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
  final Widget sourceCode;

  const LevelWidget.click({
    super.key,
    required this.title,
    required this.imageUrl,
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
    required this.imageUrl,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Nombre de usuario'),
              accountEmail: Text('correo@ejemplo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('U'),
              ),
            ),
            ListTile(
              title: const Text('Opción 1'),
              onTap: () {
                // Acción al presionar el botón
              },
            ),
            ListTile(
              title: const Text('Opción 2'),
              onTap: () {
                // Acción al presionar el botón
              },
            ),
            ListTile(
              title: const Text('Salir'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
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
                    FadeInImage.assetNetwork(
                      placeholder: circularProgressIndicatorSmall,
                      image: widget.imageUrl,
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
                  child: Text(widget.text),
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Builder(
              builder: (context) {
                return IconButton(
                  tooltip: 'Menú',
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Código Fuente',
              icon: const Icon(Icons.code),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widget.sourceCode,
                  ),
                );
              },
            ),
            IconButton(
              tooltip: 'Opciones',
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
