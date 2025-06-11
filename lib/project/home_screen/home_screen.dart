import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> widgetOption = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blueGrey,
                    child: CircleAvatar(
                      radius: 37,
                      backgroundImage: AssetImage("assets/image/cat.jpg"),
                    ),
                  ),
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
            Row(
              children: [
                Expanded(child: Divider()),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 8),
                //   child: Text("ATAU"),
                // ),
                Expanded(child: Divider()),
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              iconColor: Colors.red,
              title: Text('Logout', style: TextStyle(fontFamily: 'Gilroy')),
              onTap: () {
                SystemNavigator.pop();
                setState(() {});
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/image/pro4.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              // showDialog(context: context, builder: (context) {});
            },
            backgroundColor: Color(0xff3B3B1A),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
