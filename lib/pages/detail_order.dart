import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Form Pemesanan - ${widget.orderType}'),
        backgroundColor: const Color(0xFF3C8CE7),
        foregroundColor: Colors.white,
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
                title: Text(_tanggalPemesanan == null
                    ? 'Tanggal Pemesanan'
                    : 'Tanggal Pemesanan: ${_tanggalPemesanan!.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(_tanggalSelesai == null
                    ? 'Tanggal Selesai'
                    : 'Tanggal Selesai: ${_tanggalSelesai!.toLocal()}'.split(' ')[0]),
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
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _tanggalPemesanan != null &&
                      _tanggalSelesai != null) {
                    // Simpan data atau navigasi ke halaman lain
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pemesanan berhasil disimpan!')),
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
