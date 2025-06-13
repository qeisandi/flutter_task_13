import 'package:flutter/material.dart';
import 'package:flutter_task_13/main/bottom_nav.dart/info.dart';
import 'package:flutter_task_13/main/home_edit_screen/edit_cart.dart';
import 'package:flutter_task_13/main/home_edit_screen/home_screen.dart';

class BottomNav extends StatefulWidget {
  static const String id = "/bottom_nav";
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _bottom = 0;
  static const List<Widget> _widgetOption = <Widget>[
    HomeScreen(),
    EditCart(),
    Info(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _bottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOption.elementAt(_bottom)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Shopping List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Edit Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outlined),
            label: 'Info',
          ),
        ],
        currentIndex: _bottom,
        selectedItemColor: Color(0xff3B3B1A),
        onTap: _onItemTapped,
      ),
    );
  }
}
