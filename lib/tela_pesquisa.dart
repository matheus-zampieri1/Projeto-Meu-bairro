import 'package:flutter/material.dart';

class TelaPesquisa extends StatelessWidget {
  const TelaPesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Barra de Busca Superior (Input de Texto)
        Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Encontre lugares, atividades, grupos...',
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // 2. Banner/Header Cinza "Procure por"
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          color: Colors.grey[300],
          child: const Text(
            'Procure por',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
        ),

        // 3. Lista de Categorias com Linhas Divisórias
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildCategoryItem('PRÓXIMOS EVENTOS', () {
                  // Ação futura para abrir eventos de Santo André
                }),
                const Divider(height: 1, thickness: 1),
                _buildCategoryItem('REGIÕES', () {
                  // Ação futura para filtrar por bairros (Bairro Jardim, Centro, etc)
                }),
                const Divider(height: 1, thickness: 1),
                _buildCategoryItem('MAIS POPULAR', () {
                  // Ação futura
                }),
                const Divider(height: 1, thickness: 1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Função auxiliar para construir cada linha de categoria exatamente como no print
  Widget _buildCategoryItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
      onTap: onTap,
    );
  }
}