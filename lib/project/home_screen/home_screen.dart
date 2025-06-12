import 'package:flutter/material.dart';
import 'package:flutter_task_13/project/dbHelper/db_helper_home.dart';
import 'package:flutter_task_13/project/home_screen/helper/user_model_home.dart';
import 'package:flutter_task_13/project/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController namaC = TextEditingController();
  final TextEditingController kategoriC = TextEditingController();
  final TextEditingController hargaC = TextEditingController();
  List<Cart> daftarCart = [];
  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DatabaseHelper.getAllCart();
    setState(() {
      daftarCart = data;
    });
  }

  Future<void> simpanData() async {
    final nama = namaC.text;
    final kategori = kategoriC.text;
    final harga = int.tryParse(hargaC.text) ?? 0;

    if (nama.isNotEmpty && harga > 0) {
      await DatabaseHelper.insertCart(
        Cart(nama: nama, kategori: kategori, harga: harga),
      );
      namaC.clear();
      kategoriC.clear();
      hargaC.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text(
                        'Tambah Product',
                        style: TextStyle(fontFamily: 'Gilroy'),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: namaC,
                            decoration: InputDecoration(
                              labelText: 'Nama Produk',
                            ),
                          ),
                          TextField(
                            controller: kategoriC,
                            decoration: InputDecoration(labelText: 'Kategori'),
                          ),
                          TextField(
                            controller: hargaC,
                            decoration: InputDecoration(labelText: 'Harga'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Batal'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            simpanData();
                            Navigator.pop(context);
                          },
                          child: Text('Simpan'),
                        ),
                      ],
                    ),
              );
            },

            backgroundColor: Color(0xff3B3B1A),
            child: Icon(Icons.add_shopping_cart_sharp, color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff3B3B1A),
        centerTitle: true,
        title: Text(
          'EpruvShop',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xff3B3B1A),
                    child: CircleAvatar(
                      radius: 37,
                      backgroundImage: AssetImage("assets/image/cat.jpg"),
                    ),
                  ),
                  // SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        'Andi Qeis',
                        style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
                      ),
                      Text('Shopping List', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              iconColor: Colors.red,
              title: Text('Logout', style: TextStyle(fontFamily: 'Gilroy')),
              onTap: () {
                setState(() {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text('Apakah anda yakin ingin\nlogout?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Tidak"),
                            ),

                            TextButton(
                              onPressed: () async {
                                Navigator.pushNamed(context, LoginScreen.id);
                              },
                              child: Text("Iya"),
                            ),
                          ],
                        ),
                  );
                });
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopify, size: 40, color: Color(0xff3B3B1A)),
              SizedBox(width: 4),
              Text(
                'ShoppingList',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 36,
                  color: Color(0xff3B3B1A),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: daftarCart.length,
              itemBuilder: (context, index) {
                final Cart = daftarCart[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${Cart.id}')),
                    title: Text(
                      Cart.nama,
                      style: TextStyle(fontFamily: 'Gilroy'),
                    ),
                    subtitle: Text(
                      'kategori : ${Cart.kategori}\nharga : ${Cart.harga}',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
