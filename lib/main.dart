import 'package:flutter/material.dart';
import 'tela_login.dart'; // Importa a tela inicial de login

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Pedaço',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      // Definimos a TelaLogin como a tela inicial
      home: const TelaLogin(),
    );
  }
}