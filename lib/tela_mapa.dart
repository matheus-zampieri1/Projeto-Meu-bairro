import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaTela extends StatelessWidget {
  const MapaTela({super.key});

  @override
  Widget build(BuildContext context) {
    // Pegamos a altura da tela para o cálculo do card inferior
    final double alturaTela = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Camada do Mapa (Base)
          // Usamos ClipRRect para arredondar APENAS o mapa
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20), // Arredonda a borda inferior esquerda
              bottomRight: Radius.circular(20), // Arredonda a borda inferior direita
            ),
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(-23.6578, -46.5333), // Santo André
                initialZoom: 14.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.seuapp.meubairro',
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
          ),

          // (A barra de pesquisa que estava aqui foi removida)

          // 2. HUD - Botões Flutuantes Laterais
          Positioned(
            bottom: alturaTela * 0.25, // Sobe os botões para não cobrir o card
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.layers, color: Colors.black87),
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.my_location),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          
          // 3. HUD - Card Inferior de Informação (Santo André)
          Positioned(
            bottom: 30, // Posição igual à imagem do Figma
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    "Santo André, SP",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}