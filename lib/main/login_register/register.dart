// import 'package:flutter_task_13/project/dbHelper/Db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_13/Helper/dbHelper/db_helper.dart';
import 'package:flutter_task_13/Helper/modelUser/model_user.dart';
import 'package:flutter_task_13/main/login_register/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = "/register_screen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _hidden = true;
  bool _ikonHide = false;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Text(
                  'Register Now',

                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 24,
                    color: Color(0xff8A784E),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Sign up to your account',
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
                        hintText: 'enter email',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email harus di isi";
                        } else if (!value.contains("@gmail")) {
                          return "Email tidak valid";
                        } else if (!value.contains('.com')) {
                          return "Email tidak valid";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff888888),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: nameC,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'enter Your Name',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "nama harus di isi";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff888888),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: usernameC,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'enter username',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "username harus di isi";
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
                        hintText: 'enter password',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
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
                          return "password harus di isi";
                        } else if (value.length < 6) {
                          return "Password tidak valid";
                        }
                        return null;
                      },
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 115),
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
                            if (_fromKey.currentState!.validate()) {
                              print('email : ${emailC.text}');
                              print('name : ${nameC.text}');
                              print('username : ${usernameC.text}');
                              print('password : ${passC.text}');

                              // Simpan ke database
                              await DbHelper.registerUser(
                                data: UserModel(
                                  email: emailC.text,
                                  name: nameC.text,
                                  username: usernameC.text,
                                  password: passC.text,
                                ),
                              );

                              // Simpan ke SharedPreferences
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString('name', nameC.text);
                              await prefs.setString('username', usernameC.text);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Register Berhasil'),
                                  backgroundColor: Colors.teal,
                                ),
                              );

                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff3B3B1A),
                            padding: EdgeInsets.symmetric(
                              horizontal: 140,
                              vertical: 16,
                            ),
                          ),
                          child: Text(
                            'Register',
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
                                text: 'have an account?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff888888),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, LoginScreen.id);
                              },
                              child: Text(
                                "Sign In",
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
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
