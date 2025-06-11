import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cart {
  final int? id;
  final String nama;
  final String kategori;
  final int harga;
  Cart({
    this.id,
    required this.nama,
    required this.kategori,
    required this.harga,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'kategori': kategori,
      'harga': harga,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      kategori: map['kategori'] as String,
      harga: map['harga'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}
