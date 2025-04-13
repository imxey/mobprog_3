import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFF2EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7AB2D3),
        title: const Text('About Us', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Tim Pengembang Aplikasi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A628A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Kami adalah mahasiswa TI yang berkolaborasi untuk membuat aplikasi pemesanan jasa desain grafis berbasis mobile.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 24),

          const BioCard(
            name: 'Xeyla Vithra Arfina',
            nim: '2307411032',
            kelas: 'TI-4B',
            imagePath: 'assets/images/person1.png',
          ),
          const SizedBox(height: 16),

          const BioCard(
            name: 'Muhammad Dzaky Fuzan',
            nim: '2307411040',
            kelas: 'TI-4B',
            imagePath: 'assets/images/person2.png',
          ),
          const SizedBox(height: 16),

          const BioCard(
            name: 'Najma Gusti Ayu Mahesa',
            nim: '2307411050',
            kelas: 'TI-4B',
            imagePath: 'assets/images/person3.png',
          ),
        ],
      ),
    );
  }
}

class BioCard extends StatelessWidget {
  final String name;
  final String nim;
  final String kelas;
  final String imagePath;

  const BioCard({
    super.key,
    required this.name,
    required this.nim,
    required this.kelas,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB9E5E8), Color(0xFFDFF2EB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A628A),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.badge, size: 18, color: Colors.black54),
              const SizedBox(width: 6),
              Text('NIM: $nim', style: const TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.class_, size: 18, color: Colors.black54),
              const SizedBox(width: 6),
              Text('Kelas: $kelas', style: const TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
