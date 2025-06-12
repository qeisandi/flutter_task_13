import 'package:flutter/material.dart';
import 'package:flutter_task_13/project/dbHelper/db_helper_home.dart';
import 'package:flutter_task_13/project/home_screen/helper/user_model_home.dart';
// import 'package:sqflite/sqflite.dart';

class EditCart extends StatefulWidget {
  const EditCart({super.key});

  @override
  State<EditCart> createState() => _EditCartState();
}

class _EditCartState extends State<EditCart> {
  List<bool> _valueCheck = [];
  final TextEditingController namaC = TextEditingController();
  final TextEditingController kategoriC = TextEditingController();
  final TextEditingController hargaC = TextEditingController();

  List<Cart> daftarCart = [];
  @override
  void initState() {
    super.initState();
    _valueCheck = List<bool>.filled(daftarCart.length, false);
    muatData();
  }

  Future<void> muatData() async {
    final data = await DatabaseHelper.getAllCart();
    setState(() {
      daftarCart = data;
      _valueCheck = List<bool>.filled(
        daftarCart.length,
        false,
      ); // <-- Pindahkan ke sini
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
      appBar: AppBar(
        leading: Container(),
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
      body: Column(
        children: [
          SizedBox(height: 12),
          Text(
            'EditCart',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 36,
              color: Color(0xff3B3B1A),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: daftarCart.length,
              itemBuilder: (context, index) {
                final cart = daftarCart[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${cart.id}')),
                    title: Text(
                      cart.nama,
                      style: TextStyle(fontFamily: 'Gilroy'),
                    ),
                    subtitle: Text(
                      'kategori : ${cart.kategori}\nharga : ${cart.harga}',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          activeColor: Color(0xff3B3B1A),
                          value: _valueCheck[index], // gunakan index
                          onChanged: (value) {
                            setState(() {
                              // Reset semua ke false
                              for (int i = 0; i < _valueCheck.length; i++) {
                                _valueCheck[i] = false;
                              }
                              // Hanya index yang dicentang jadi true
                              _valueCheck[index] = value!;
                            });
                          },
                        ),
                        IconButton(
                          onPressed: () async {
                            namaC.text = cart.nama;
                            kategoriC.text = cart.kategori;
                            hargaC.text = cart.harga.toString();
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: Text(
                                      'Edit Product',
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
                                          decoration: InputDecoration(
                                            labelText: 'Kategori',
                                          ),
                                        ),
                                        TextField(
                                          controller: hargaC,
                                          decoration: InputDecoration(
                                            labelText: 'Harga',
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Batal'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await DatabaseHelper.updateCart(
                                            Cart(
                                              id: cart.id,
                                              nama: namaC.text,
                                              kategori: kategoriC.text,
                                              harga:
                                                  int.tryParse(hargaC.text) ??
                                                  0,
                                            ),
                                          );
                                          Navigator.pop(context);
                                          muatData();
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Berhasil Mengubah Product",
                                              ),
                                              backgroundColor: Colors.teal,
                                            ),
                                          );
                                        },
                                        child: Text('Update'),
                                      ),
                                    ],
                                  ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: Text(
                                      'Apakah anda yakin ingin\nmembatalkan pesanan?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Batal"),
                                      ),

                                      TextButton(
                                        onPressed:
                                            _valueCheck.contains(true)
                                                ? () async {
                                                  await DatabaseHelper.deleteCart(
                                                    cart.id!,
                                                  );
                                                  muatData();
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        "Berhasil Melakukan Pembatalan",
                                                      ),
                                                      backgroundColor:
                                                          Colors.teal,
                                                    ),
                                                  );
                                                }
                                                : null,
                                        child: Text("Lanjut"),
                                      ),
                                    ],
                                  ),
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
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
