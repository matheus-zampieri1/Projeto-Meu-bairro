import 'package:flutter/material.dart';

import 'tela_pesquisa.dart';
import 'tela_mapa.dart'; 
import 'tela_feed.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _indiceAtual = 3; // Começa no Mapa

  final List<String> _titulos = [
    'HOME',
    'PESQUISAR',
    'POSTAR',
    'MAPA',
    'RANKING',
  ];


  late final List<Widget> _paginas = [
    const TelaFeed(), 
    const TelaPesquisa(),
    const Center(child: Text('Adicionar Publicação')),
    const MapaTela(), 
    const Center(child: Text('Ranking')),
  ];

  late final List<Widget> paginas = [
    const TelaFeed(),
    const TelaPesquisa(),
    const Center(child: Text('Adicionar Publicação')),
    const MapaTela(),
    const Center(child: Text('Página Ranking')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: Column(
          children: [
            const Text(
              'MEU PEDAÇO',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                letterSpacing: 2,
              ),
            ),
            Text(
              _titulos[_indiceAtual],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _paginas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Busca'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline, size: 35), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events_outlined), label: 'Ranking'),
        ],
      ),
    );
  }
}