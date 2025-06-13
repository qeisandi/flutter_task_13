import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  static const String id = "/profile";

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? nameUser;
  String? usernameUser;
  @override
  void initState() {
    super.initState();
    ambilDataUser();
  }

  Future<void> ambilDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameUser = prefs.getString('name') ?? 'No Name';
      usernameUser = prefs.getString('username') ?? '@username';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_sharp),
          color: Colors.white,
        ),
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
          Center(
            child: SizedBox(
              height: 800,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Color(0xff3B3B1A),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage("assets/image/cat.jpg"),
                      ),
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Text(
                          nameUser ?? 'Loading...',
                          style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
                        ),
                        Text(
                          '@${usernameUser ?? 'username'}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
