import 'package:flutter/material.dart';
import 'package:flutter_task_13/main/login_register/login.dart';
import 'package:flutter_task_13/main/login_register/register.dart';

class Splash extends StatefulWidget {
  static const String id = "/Splash";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff3B3B1A),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 250),
            Center(
              child: Text(
                'Welcome.',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 40,
                  color: Color(0xff8A784E),
                ),
              ),
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3B3B1A),
                    padding: EdgeInsets.symmetric(
                      horizontal: 150,
                      vertical: 16,
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontFamily: 'Gilroy', color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Dont have an account?',
                    style: TextStyle(fontSize: 14, color: Color(0xff888888)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff8A784E),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Or Sign In With",
                    style: TextStyle(fontSize: 14, color: Color(0xff888888)),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                    // backgroundColor: Color(0xffAEC8A4),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/image/Google.png'),
                      SizedBox(width: 20),
                      Text(
                        'Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/image/Facebook.png"),
                      SizedBox(width: 20),
                      Text(
                        'Facebook',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text.rich(
                  //   TextSpan(
                  //     text: 'Dont have an account?',
                  //     style: TextStyle(fontSize: 14, color: Color(0xff888888)),
                  //   ),
                  // ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Join Us",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff8A784E),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
