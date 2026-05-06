import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TelaLogin(),
    );
  }
}