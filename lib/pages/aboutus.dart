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
        children: const [
          BioCard(
            name: 'Xeyla Vithra Arfina',
            nim: '2307411032',
            kelas: 'TI-4B',
            imagePath: 'assets/images/person1.png',
          ),
          SizedBox(height: 16),
          BioCard(
            name: 'Muhammad Dzaky Fuzan',
            nim: '2307411040',
            kelas: 'TI-4B',
            imagePath: 'assets/images/person2.png',
          ),
          SizedBox(height: 16),
          BioCard(
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
        color: const Color(0xFFB9E5E8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: $name', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('NIM: $nim', style: const TextStyle(fontSize: 14)),
                Text('Kelas: $kelas', style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
