import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff3B3B1A),
        centerTitle: true,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
            Icon(Icons.shopify, size: 30, color: Colors.white),
            Text(
              'EpruvShop',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Tentang Aplikasi',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 36,
              color: Color(0xff3B3B1A),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Aplikasi ini dibuat sebagai project Flutter yang menampilkan lengkap dari splash screen sampai halaman ini, dan aplikasi ini bertujuan untuk mendata atau menampilkan shopping list.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Pembuat: Andi Qeis',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Text('Versi: 2.5.0', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
