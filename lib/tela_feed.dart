import 'package:flutter/material.dart';

class TelaFeed extends StatefulWidget {
  const TelaFeed({super.key});

  @override
  State<TelaFeed> createState() => _TelaFeedState();
}

class _TelaFeedState extends State<TelaFeed> {
  // Lista de dados fictícios (Mock Data) focados em Santo André
  final List<Map<String, dynamic>> _posts = [
    {
      'username': 'andre_cultural',
      'userImage': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
      'location': 'Parque Celso Daniel, Santo André',
      'postImage': 'https://images.unsplash.com/photo-1543269865-cbf427effbad?w=600', // Imagem simulando evento/feira
      'caption': 'Neste final de semana vai rolar a Feira de Economia Criativa aqui no Parque Celso Daniel! Muito artesanato local, food trucks e música ao vivo para toda a família. Quem vai? 🌳🍔🎨 #SantoAndre #CulturaABC #ParqueCelsoDaniel',
      'likes': 142,
      'isLiked': false,
    },
    {
      'username': 'morador_bairro_jardim',
      'userImage': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      'location': 'Rua das Figueiras, Bairro Jardim',
      'postImage': 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=600', // Imagem simulando restaurante/rua movimentada
      'caption': 'Alguém sabe se o trânsito na altura da Figueiras com a Dom Pedro II já normalizou depois daquela manutenção na via? Preciso passar por aí jaja! 🚗⚠️ #TransitoSA #BairroJardim #UtilidadePublica',
      'likes': 38,
      'isLiked': false,
    },
    {
      'username': 'paranapiacaba_trekking',
      'userImage': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150',
      'location': 'Vila de Paranapiacaba, Santo André',
      'postImage': 'https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=600', // Imagem simulando natureza/neblina
      'caption': 'A neblina clássica já tomou conta da Vila hoje cedo. Estamos organizando um grupo de caminhada fotográfica para o próximo Festival de Inverno. Interessados, me chamem no privado para entrar no grupo da comunidade! 🌫️📸🥾 #Paranapiacaba #TurismoSA #EcoABC',
      'likes': 215,
      'isLiked': false,
    },
    {
      'username': 'ong_patinhas_sa',
      'userImage': 'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=150',
      'location': 'Centro, Santo André',
      'postImage': 'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?w=600', // Imagem simulando pets
      'caption': 'Campanha de adoção responsável neste sábado na Praça do Carmo! Temos 12 cãezinhos e gatinhos resgatados aqui em Santo André esperando por um lar amoroso. Compartilhem para ajudar! 🐾❤️ #AdoteSA #CausaAnimal #SantoAndre',
      'likes': 312,
      'isLiked': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Conecta Santo André',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return _PostWidget(
            username: post['username'],
            userImage: post['userImage'],
            location: post['location'],
            postImage: post['postImage'],
            caption: post['caption'],
            likes: post['likes'],
            isLiked: post['isLiked'],
            onLikePressed: () {
              setState(() {
                post['isLiked'] = !post['isLiked'];
                if (post['isLiked']) {
                  post['likes']++;
                } else {
                  post['likes']--;
                }
              });
            },
          );
        },
      ),
    );
  }
}

class _PostWidget extends StatelessWidget {
  final String username;
  final String userImage;
  final String location;
  final String postImage;
  final String caption;
  final int likes;
  final bool isLiked;
  final VoidCallback onLikePressed;

  const _PostWidget({
    required this.username,
    required this.userImage,
    required this.location,
    required this.postImage,
    required this.caption,
    required this.likes,
    required this.isLiked,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho (Usuário e Localização de Santo André)
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
            title: Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: Colors.redAccent),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    location,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),
          
          // Imagem Ilustrativa do Post
          Image.network(
            postImage,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.broken_image)),
              );
            },
          ),
          
          // Barra de Interações
          Row(
            children: [
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.black,
                ),
                onPressed: onLikePressed,
              ),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Comentários indisponíveis no protótipo')),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.share_outlined),
                onPressed: () {},
              ),
            ],
          ),
          
          // Texto e Hashtags
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$likes curtidas', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, height: 1.3),
                    children: [
                      TextSpan(text: '$username ', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: caption),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}