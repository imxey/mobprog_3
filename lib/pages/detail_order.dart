import 'package:flutter/material.dart';
import 'confirmation_order.dart';

class OrderFormPage extends StatefulWidget {
  final String orderType;

  const OrderFormPage({Key? key, required this.orderType}) : super(key: key);

  @override
  State<OrderFormPage> createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  DateTime? _tanggalPemesanan;
  DateTime? _tanggalSelesai;

  Future<void> _selectDate(BuildContext context, bool isPemesanan) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        if (isPemesanan) {
          _tanggalPemesanan = picked;
        } else {
          _tanggalSelesai = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Kurangi tingginya
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Kurangi padding vertical
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Form Pemesanan - ${widget.orderType}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Agar teks tetap di tengah (kompensasi untuk IconButton)
                ],
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pemesan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  _tanggalPemesanan != null
                      ? 'Tanggal Pemesanan: ${_tanggalPemesanan!.toLocal().toString().split(' ')[0]}'
                      : 'Tanggal Pemesanan: yyyy-mm-dd',
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  _tanggalSelesai != null
                      ? 'Tanggal Selesai: ${_tanggalSelesai!.toLocal().toString().split(' ')[0]}'
                      : 'Tanggal Selesai: yyyy-mm-dd',
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _deskripsiController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Desain',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3C8CE7),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _tanggalPemesanan != null &&
                      _tanggalSelesai != null) {

                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) => OrderConfirmationPage(
                          nama: _namaController.text,
                          deskripsi: _deskripsiController.text,
                          tanggalPemesanan: _tanggalPemesanan!,
                          tanggalSelesai: _tanggalSelesai!,
                          orderType: widget.orderType,
                        ),
                        transitionsBuilder: (_, animation, __, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Lengkapi semua data!')),
                    );
                  }
                },
                child: const Text(
                  'Kirim Pemesanan',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
