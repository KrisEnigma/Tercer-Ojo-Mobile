import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tercer_ojo_mobile/level1.dart';

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
        child: SingleChildScrollView(
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
      ),
    );
  }
}
