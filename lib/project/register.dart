// import 'package:flutter_task_13/project/dbHelper/Db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_13/project/dbHelper/db_helper.dart';
import 'package:flutter_task_13/project/modelUser/user_model.dart';

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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_sharp),
        ),
        title: Text('Register', style: TextStyle(fontFamily: 'Gilroy')),
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
                  style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
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
                        hintStyle: TextStyle(fontSize: 14),
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
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "name must be fill";
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
                        hintStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "username must be fill";
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
                                  color: Color(0xffEA9459),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            if (_fromKey.currentState!.validate()) {
                              print('email : ${emailC.text}');
                              print('name : ${nameC.text}');
                              print('username : ${usernameC.text}');
                              print('password : ${passC.text}');
                              DbHelper.registerUser(
                                data: UserModel(
                                  email: emailC.text,
                                  name: nameC.text,
                                  username: usernameC.text,
                                  password: passC.text,
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Register Succesful'),
                                  backgroundColor: Colors.teal,
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff283FB1),
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
                              onPressed: () {},
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffEA9459),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // Row(
                        //   children: [
                        //     Expanded(child: Divider()),
                        //     Padding(
                        //       padding: EdgeInsets.symmetric(horizontal: 8),
                        //       child: Text(
                        //         "Or Sign In With",
                        //         style: TextStyle(
                        //           fontSize: 14,
                        //           color: Color(0xff888888),
                        //         ),
                        //       ),
                        //     ),
                        //     Expanded(child: Divider()),
                        //   ],
                        // ),
                        // SizedBox(height: 40),
                        // Row(
                        //   children: [
                        //     ElevatedButton(
                        //       onPressed: () {},
                        //       style: ElevatedButton.styleFrom(
                        //         padding: EdgeInsets.symmetric(
                        //           horizontal: 40,
                        //           vertical: 16,
                        //         ),
                        //       ),
                        //       child: Row(
                        //         children: [
                        //           Image.asset('assets/image/Google.png'),
                        //           SizedBox(width: 20),
                        //           Text(
                        //             'Google',
                        //             style: TextStyle(
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.w300,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(width: 24),
                        //     ElevatedButton(
                        //       onPressed: () {},
                        //       style: ElevatedButton.styleFrom(
                        //         padding: EdgeInsets.symmetric(
                        //           horizontal: 40,
                        //           vertical: 16,
                        //         ),
                        //       ),
                        //       child: Row(
                        //         children: [
                        //           Image.asset("assets/image/Facebook.png"),
                        //           SizedBox(width: 20),
                        //           Text(
                        //             'Facebook',
                        //             style: TextStyle(
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.w300,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 20),
                        // Row(
                        //   children: [
                        //     Text.rich(
                        //       TextSpan(
                        //         text: 'Dont have an account?',
                        //         style: TextStyle(
                        //           fontSize: 14,
                        //           color: Color(0xff888888),
                        //         ),
                        //       ),
                        //     ),
                        //     TextButton(
                        //       onPressed: () {},
                        //       child: Text(
                        //         "Join Us",
                        //         style: TextStyle(
                        //           fontSize: 14,
                        //           color: Color(0xffEA9459),
                        //           fontWeight: FontWeight.w800,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
