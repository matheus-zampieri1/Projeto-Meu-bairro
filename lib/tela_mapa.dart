import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // O Stack permite colocar widgets sobre o mapa
        children: [
          // 1. Camada do Mapa (Base)
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(-23.6578, -46.5333), // Foco em Santo André
              initialZoom: 14.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.seuapp.meubairro',
                // Se o mapa falhar ao carregar, ele mostrará uma cor de fundo clara
                // Isso ajuda a diferenciar se o problema é o download ou a tela cinza do Flutter
                tileBuilder: (context, tileWidget, tile) {
                  return Container(
                    color: Colors.grey[200], // Cor de fundo enquanto carrega
                    child: tileWidget,
                  );
                },
                // O parâmetro correto nas versões novas para erro é o errorTileCallback
                errorTileCallback: (tile, error, stackTrace) {
                  print("Erro ao carregar o mapa de Santo André: $error");
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(-23.6578, -46.5333),
                    width: 80,
                    height: 80,
                    child: Icon(Icons.location_on, color: Colors.blue, size: 40),
                  ),
                ],
              ),
            ],
          ),

          // 2. HUD - Barra de Pesquisa Superior
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Pesquisar no bairro...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),

          // 3. HUD - Botões Flutuantes Laterais
          Positioned(
            bottom: 30,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.layers, color: Colors.black87),
                  onPressed: () {}, // Futuro: Trocar camadas do mapa
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.my_location),
                  onPressed: () {}, // Futuro: Centralizar no GPS do usuário
                ),
              ],
            ),
          ),
          
          // 4. HUD - Card Inferior de Informação
          Positioned(
            bottom: 30,
            left: 20,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue),
                  SizedBox(width: 10),
                  Text("Santo André, SP", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}