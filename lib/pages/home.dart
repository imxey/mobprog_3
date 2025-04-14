import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'detail_order.dart';

final List<String> orderTitles = [
  'Logo',
  'Poster',
  'Banner',
  'Kartu Nama',
  'Kotak Box',
  'Brosur',
];

final List<String> orderDescriptions = [
  'Desain logo profesional yang merepresentasikan brand Anda.',
  'Poster menarik untuk promosi event, produk, atau layanan.',
  'Banner visual untuk keperluan online atau cetak.',
  'Poster kedua sebagai variasi (dummy).',
  'Kartu nama elegan dengan sentuhan profesional.',
  'Brosur informatif yang mudah dibaca dan menarik.',
];

final List<String> orderImages = [
  'assets/contoh_logo.png',
  'assets/poster.png',
  'assets/banner.png',
  'assets/kartu_nama.png',
  'assets/kemasan_box.png',
  'assets/brosur.png',
];


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final InfiniteScrollController _controller = InfiniteScrollController();
  int _currentIndex = 0;

  void _goToPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _controller.animateToItem(_currentIndex);
      });
    }
  }

  void _goToNext() {
    if (_currentIndex < orderTitles.length - 1) {
      setState(() {
        _currentIndex++;
        _controller.animateToItem(_currentIndex);
      });
    }
  }

  void _showOrderDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Desain ${orderTitles[index]}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C8CE7),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      orderImages[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Gagal load gambar');
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Deskripsi design',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C8CE7),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  orderDescriptions[index],
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8BBEE8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OrderFormPage(orderType: orderTitles[index]),
                        ),
                      );
                    },
                    child: const Text(
                      'Pesan Desain',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF3C8CE7), Color(0xFF00EAFF)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'LOGO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.notifications, color: Colors.white),
                          SizedBox(width: 12),
                          Icon(Icons.settings, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Icon(Icons.image, size: 80, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 2),
                    child: Text(
                      'Order Design',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF4B4F57),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Color(0xFF4B4F57),
                          onPressed: _currentIndex > 0 ? _goToPrevious : null,
                        ),
                        Expanded(
                          child: InfiniteCarousel.builder(
                            itemCount: orderTitles.length,
                            itemExtent: 100,
                            center: false, // <--- agar tidak ada space saat di ujung
                            loop: false,   // <--- mencegah pengulangan item
                            anchor: 0.0,   // <--- item awal nempel kiri
                            controller: _controller,
                            itemBuilder: (context, index, realIndex) {
                              return GestureDetector(
                                onTap: () => _showOrderDialog(index),
                                child: SizedBox(
                                  height: 130,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 6,
                                              offset: Offset(0, 3),
                                            )
                                          ],
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Icon(Icons.design_services, color: Color(0xFF3C8CE7), size: 30),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          orderTitles[index],
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF3C8CE7),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: Color(0xFF4B4F57),
                          onPressed: _currentIndex < orderTitles.length - 1 ? _goToNext : null,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Text(
                      'Artikel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B4F57),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        return Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                              child: const Icon(Icons.article, color: Color(0xFF3C8CE7)),
                            ),
                            const SizedBox(height: 8),
                            const Text('Judul artikel', style: TextStyle(fontSize: 12)),
                          ],
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tentang Aplikasi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4B4F57),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Aplikasi ini dirancang khusus untuk mempermudah proses pemesanan jasa desain grafis, baik untuk kebutuhan logo, kemasan produk, maupun kebutuhan desain lainnya. '
                                'Dengan hadirnya aplikasi ini, pengguna tidak perlu lagi melakukan pemesanan secara manual yang memakan waktu dan rentan terhadap kesalahan pencatatan.\n\n'

                                'Aplikasi ini dilengkapi dengan berbagai fitur unggulan, antara lain:\n\n'
                                '• Formulir Pemesanan Online\n'
                                'Pengguna dapat mengisi detail kebutuhan desain secara lengkap, mulai dari jenis desain yang diinginkan, referensi visual, hingga deadline pengerjaan.\n\n'

                                '• Katalog Portofolio Desainer\n'
                                'Tersedia katalog berisi portofolio dari para desainer, sehingga pengguna bisa memilih desainer yang sesuai dengan gaya desain yang diinginkan.\n\n'

                                '• Fitur Chat & Konsultasi\n'
                                'Memungkinkan komunikasi langsung antara klien dan desainer untuk diskusi konsep, revisi, atau tanya jawab seputar desain.\n\n'

                                '• Riwayat dan Status Pesanan\n'
                                'Pengguna dapat melihat status pesanan secara real-time, apakah sedang dalam proses, revisi, atau telah selesai.\n\n'

                                '• Notifikasi Otomatis\n'
                                'Pengingat otomatis akan dikirimkan kepada pengguna terkait update pesanan, pembayaran, atau tenggat waktu revisi.\n\n'

                                '• Sistem Pembayaran Terintegrasi\n'
                                'Pembayaran dapat dilakukan langsung melalui aplikasi dengan metode yang beragam dan aman.',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
