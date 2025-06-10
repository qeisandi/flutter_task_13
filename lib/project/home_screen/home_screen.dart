import 'package:flutter/material.dart';
// import 'package:flutter_task_13/project/home_screen/model_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final List<Elektronik> kategoriC = [
  //   Elektronik(
  //     id: "1",
  //     productName: "PS5 X Spiderman",
  //     productPrice: '12.000.000,00',
  //     productImage: "assets/image/pro4.jpg",
  //   ),
  //   Elektronik(
  //     id: "2",
  //     productName: "Laptop Advan",
  //     productPrice: '1.200.000,00',
  //     productImage: "assets/image/pro10.jpg",
  //   ),
  //   Elektronik(
  //     id: "3",
  //     productName: "Iphone xr",
  //     productPrice: '8.000.000,00',
  //     productImage: "assets/image/pro9.jpg",
  //   ),
  //   Elektronik(
  //     id: "4",
  //     productName: "Iphone 16pro",
  //     productPrice: '18.000.000,00',
  //     productImage: "assets/image/pro5.jpg",
  //   ),
  //   Elektronik(
  //     id: "5",
  //     productName: "Nintendo Switch",
  //     productPrice: '23.100.000,00',
  //     productImage: "assets/image/pro1.jpg",
  //   ),
  //   Elektronik(
  //     id: "6",
  //     productName: "Vr holocaust one set",
  //     productPrice: '40.000.000,00',
  //     productImage: "assets/image/pro3.jpg",
  //   ),
  //   Elektronik(
  //     id: "7",
  //     productName: "TV Toshiba",
  //     productPrice: '3.000.000,00',
  //     productImage: "assets/image/pro2.jpg",
  //   ),
  //   Elektronik(
  //     id: "8",
  //     productName: "Vynl",
  //     productPrice: '1.000.000,00',
  //     productImage: "assets/image/pro7.jpg",
  //   ),
  //   Elektronik(
  //     id: "9",
  //     productName: "HTC one",
  //     productPrice: '12.000.000,00',
  //     productImage: "assets/image/pro6.jpg",
  //   ),
  //   Elektronik(
  //     id: "10",
  //     productName: "Smartphone samsung s24",
  //     productPrice: '20.300.000,00',
  //     productImage: "assets/image/pro8.jpg",
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE7EFC7),
      appBar: AppBar(
        backgroundColor: Color(0xff3B3B1A),
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset('assets/image/pro2.jpg', width: 40),
                  ),
                ],
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(height: 24),
              ListTile(
                leading: Image.asset('assets/image/pro1.jpg'),
                title: Text('Data', style: TextStyle(fontFamily: 'Gilroy')),
                subtitle: Text('data\ndata\ndata'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
