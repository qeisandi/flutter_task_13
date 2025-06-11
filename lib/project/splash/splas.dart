import 'package:flutter/material.dart';
import 'package:flutter_task_13/project/login.dart';
import 'package:flutter_task_13/project/register.dart';

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
        backgroundColor: Color(0xff3B3B1A),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.keyboard_arrow_left_sharp),
        //   ),
        // ),
        title: Center(
          child: Text(
            'EpruvShop',
            style: TextStyle(fontFamily: 'Gilroy', color: Colors.white),
          ),
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
            // SizedBox(height: 20),
            // Text(
            //   'Sign in to your account',
            //   style: TextStyle(fontSize: 14, color: Color(0xff888888)),
            // ),
            // SizedBox(height: 28),
            // Expanded(
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           Text(
            //             'Email Address',
            //             style: TextStyle(
            //               fontSize: 13,
            //               color: Color(0xff888888),
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 16),
            //       SizedBox(height: 20),
            //       Row(
            //         children: [
            //           Text(
            //             'Password',
            //             style: TextStyle(
            //               fontSize: 13,
            //               color: Color(0xff888888),
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 16),
            // Column(
            //   children: [
            //     Row(
            //       children: [
            //         Padding(padding: EdgeInsets.symmetric(horizontal: 122)),
            //         TextButton(
            //           onPressed: () {},
            //           child: Text(
            //             'Forgot Password?',
            //             style: TextStyle(
            //               fontSize: 12,
            //               color: Color(0xffEA9459),
            //               fontWeight: FontWeight.w800,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff3B3B1A),
                padding: EdgeInsets.symmetric(horizontal: 175, vertical: 16),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontFamily: 'Gilroy', color: Colors.white),
              ),
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
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
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
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
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
