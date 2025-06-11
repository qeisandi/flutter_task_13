// import 'package:flutter_task_13/project/dbHelper/Db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_13/project/bottom_nav.dart/bottom_nav.dart';
import 'package:flutter_task_13/project/dbHelper/db_helper.dart';
import 'package:flutter_task_13/project/register.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "/login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidden = true;
  bool _ikonHide = false;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff3B3B1A),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_sharp),
          color: Colors.white,
        ),
        title: Text(
          'EpruvShop',
          style: TextStyle(fontFamily: 'Gilroy', color: Colors.white),
        ),
      ),
      body: Form(
        key: _fromKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                'Login Your account',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 24,
                  color: Color(0xff8A784E),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sign in to your account',
                style: TextStyle(fontSize: 14, color: Color(0xff888888)),
              ),
              SizedBox(height: 28),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff888888),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: emailC,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded),
                      hintText: 'enter username',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      } else if (!value.contains("@")) {
                        return "Email tidak valid";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff888888),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: passC,
                    textInputAction: TextInputAction.done,
                    obscureText: _hidden,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      hintText: 'enter password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (_hidden == true) {
                            _hidden = false;
                          } else {
                            _hidden = true;
                          }
                          setState(() {
                            _ikonHide = !_ikonHide;
                          });
                        },
                        icon:
                            _ikonHide
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off_outlined),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password must be fill";
                      } else if (value.length < 10) {
                        return "Password not valid";
                      }
                      return null;
                    },
                  ),
                  // SizedBox(height: 16),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 122),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff8A784E),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          if (_fromKey.currentState!.validate()) {}
                          // PreferenceHandler.saveLogin(true);
                          final userData = await DbHelper.login(
                            emailC.text,
                            passC.text,
                          );
                          if (userData != null) {
                            print('data ada ${userData.toJson()}');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login successful")),
                            );
                            Navigator.pushNamed(context, BottomNav.id);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Invalid email or password"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff3B3B1A),
                          padding: EdgeInsets.symmetric(
                            horizontal: 160,
                            vertical: 16,
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Dont have an account?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff888888),
                              ),
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
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff888888),
                              ),
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
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
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Dont have an account?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff888888),
                              ),
                            ),
                          ),
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
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
