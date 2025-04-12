import 'package:flutter/material.dart';
import 'chat_detail.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String selectedFilter = 'Semua';

  List<Map<String, dynamic>> orders = [
    {
      "title": "Desain Logo",
      "designer": "Nama Desainer",
      "status": "Selesai",
      "date": "10 April 2025",
      "estimate": "13 April 2025",
      "notes": "Warna dominan biru",
      "image": "https://via.placeholder.com/150",
      "revisable": false,
    },
    {
      "title": "Desain Feed IG",
      "designer": "Nama Desainer",
      "status": "Sedang diproses",
      "date": "11 April 2025",
      "estimate": "15 April 2025",
      "notes": "",
      "image": "",
      "revisable": true,
    },
    {
      "title": "Desain Poster",
      "designer": "Nama Desainer",
      "status": "Batal",
      "date": "9 April 2025",
      "notes": "",
      "image": "",
      "revisable": false,
    },
  ];

  List<String> filters = ['Semua', 'Selesai', 'Sedang diproses', 'Batal'];

  final Color color1 = const Color(0xFFDFF2EB); // Card background
  final Color color2 = const Color(0xFFB9E5E8); // Dropdown background
  final Color color3 = const Color(0xFF7AB2D3); // AppBar
  final Color color4 = const Color(0xFF4A628A); // Judul / utama

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredOrders = selectedFilter == 'Semua'
        ? orders
        : orders.where((o) => o['status'] == selectedFilter).toList();

    return Scaffold(
      backgroundColor: color2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: color3,
        title: const Text('Order History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedFilter,
                style: TextStyle(fontSize: 18, color: color4),
                iconEnabledColor: color4,
                underline: const SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFilter = newValue!;
                  });
                },
                items: filters.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  var order = filteredOrders[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.design_services, size: 50),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(order['title'] ?? 'Design Name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: color4)),
                              const SizedBox(height: 4),
                              Text(order['designer'],
                                  style: const TextStyle(fontSize: 16)),
                              const SizedBox(height: 8),
                              Text(
                                order['status'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: order['status'] == 'Selesai'
                                      ? Colors.green
                                      : order['status'] == 'Sedang diproses'
                                      ? Colors.orange
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => _showDetailDialog(context, order),
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            if (order['status'] == 'Sedang diproses')
                              const SizedBox(height: 8),
                            if (order['status'] == 'Sedang diproses')
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const ChatDetailScreen()),
                                  );
                                },
                                child: const Text(
                                  'Chat now',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order['title'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text("Status: ${order['status']}", style: const TextStyle(fontSize: 16)),
                  Text("Tanggal Pemesanan: ${order['date']}", style: const TextStyle(fontSize: 16)),
                  if (order['status'] != 'Selesai' && order['estimate'] != null)
                    Text("Estimasi Selesai: ${order['estimate']}", style: const TextStyle(fontSize: 16)),
                  Text("Nama Desainer: ${order['designer']}", style: const TextStyle(fontSize: 16)),
                  if (order['notes'] != "")
                    Text("Catatan: ${order['notes']}", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  if (order['status'] == 'Selesai')
                    Column(
                      children: [
                        Image.network(order['image']),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // aksi unduh
                          },
                          child: const Text('Unduh Desain'),
                        ),
                      ],
                    ),
                  if (order['status'] == 'Sedang diproses')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Progress Preview:", style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 10),
                        Container(
                          height: 100,
                          color: Colors.grey[300],
                          child: const Center(child: Text("Preview Gambar")),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Tutup'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
