import 'package:flutter/material.dart';
import 'dart:ui'; // Dibutuhkan untuk BoxDecoration dan DecorationImage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penjualan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PenjualanScreen(),
    );
  }
}

class PenjualanScreen extends StatelessWidget {
  final List<Map<String, dynamic>> produkList = [
    {
      'nama': 'Adidas',
      'harga': 1000000,
      'rating': 4.5,
      'gambar': 'https://i.ebayimg.com/images/g/jpoAAOSw3XJg5vsZ/s-l1200.webp',
    },
    {
      'nama': 'Converse',
      'harga': 1500000,
      'rating': 4.2,
      'gambar': 'https://i.ebayimg.com/images/g/YVUAAOSwIkBhrwO7/s-l1200.jpg',
    },
    {
      'nama': 'New Balance',
      'harga': 2000000,
      'rating': 4.8,
      'gambar': 'https://images.tokopedia.net/img/cache/700/hDjmkQ/2023/2/1/db4589d9-32ee-4b58-ad84-a328b9a1c87b.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjualan'),
      ),
      body: ListView.builder(
        itemCount: produkList.length,
        itemBuilder: (context, index) {
          final produk = produkList[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(produk['gambar']),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        produk['nama'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Rp ${produk['harga'].toString()}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            produk['rating'].toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Aksi ketika tombol "Beli Sekarang" ditekan
                              },
                              child: Text('Beli Sekarang'),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                // Aksi ketika tombol "Tambah ke Keranjang" ditekan
                              },
                              child: Text('Tambah ke Keranjang'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}