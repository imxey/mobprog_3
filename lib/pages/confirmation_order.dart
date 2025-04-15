import 'package:flutter/material.dart';
import 'main_screen.dart';

class OrderConfirmationPage extends StatefulWidget {
  final String nama;
  final String deskripsi;
  final DateTime tanggalPemesanan;
  final DateTime tanggalSelesai;
  final String orderType;

  const OrderConfirmationPage({
    Key? key,
    required this.nama,
    required this.deskripsi,
    required this.tanggalPemesanan,
    required this.tanggalSelesai,
    required this.orderType,
  }) : super(key: key);

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  String? _selectedPaymentMethod;

  final List<String> paymentMethods = [
    'Transfer Bank',
    'e-Wallet (OVO, DANA, dll)',
    'Kartu Kredit'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Konfirmasi Pesanan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detail Pemesanan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C8CE7),
                  ),
                ),
                const SizedBox(height: 12),
                _buildInfoRow('Nama Pemesan', widget.nama),
                _buildInfoRow('Tipe Order', widget.orderType),
                _buildInfoRow('Tanggal Pemesanan',
                    '${widget.tanggalPemesanan.toLocal().toString().split(' ')[0]}'),
                _buildInfoRow('Tanggal Selesai',
                    '${widget.tanggalSelesai.toLocal().toString().split(' ')[0]}'),
                _buildInfoRow('Deskripsi Desain', widget.deskripsi),
                const SizedBox(height: 16),
                const Text(
                  'Metode Pembayaran',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF4B4F57),
                  ),
                ),
                const SizedBox(height: 8),
                ...paymentMethods.map((method) {
                  return RadioListTile<String>(
                    title: Text(method),
                    value: method,
                    activeColor: const Color(0xFF3C8CE7),
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  );
                }).toList(),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C8CE7),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _selectedPaymentMethod != null
                        ? () {
                      // Simulasi proses pembayaran
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Pembayaran via $_selectedPaymentMethod diproses...',
                          ),
                        ),
                      );
                      // Navigasi langsung ke Home
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                            (route) => false,
                      );
                    }
                        : null,
                    child: const Text(
                      'Bayar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B4F57),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
