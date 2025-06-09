import 'package:flutter/material.dart';

class TugasTigaBelas extends StatefulWidget {
  const TugasTigaBelas({super.key});

  @override
  State<TugasTigaBelas> createState() => _TugasTigaBelasState();
}

class _TugasTigaBelasState extends State<TugasTigaBelas> {
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left_sharp),
        ),
        title: const Text('Login', style: TextStyle(fontFamily: 'Gilroy')),
      ),
      body: Padding(
        key: _fromKey,
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Welcome home',
              style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sign in to your account',
              style: TextStyle(fontSize: 14, color: Color(0xff888888)),
            ),
            const SizedBox(height: 28),
            Form(
              child: Column(
                children: [
                  const Row(
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
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailC,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'enter username',
                      hintStyle: const TextStyle(fontSize: 14),
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
                  const SizedBox(height: 20),
                  const Row(
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
                  const SizedBox(height: 16),
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
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
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
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 122),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
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
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_fromKey.currentState!.validate()) {
                            print('Berhasil');
                            // dialogSuccess(context);
                          }
                          // print(
                          //   'LOGIN DENGAN : EMAIL (${emailC.text}) & PASS (${passC.text})',
                          // );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const MeetTiga(),
                          //   ),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff283FB1),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 160,
                            vertical: 16,
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text.rich(
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
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffEA9459),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Row(
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
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/image/Google.png'),
                                const SizedBox(width: 20),
                                const Text(
                                  'Google',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset("assets/image/Facebook.png"),
                                const SizedBox(width: 20),
                                const Text(
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
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text.rich(
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
                            child: const Text(
                              "Join Us",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffEA9459),
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
            ),
          ],
        ),
      ),
    );
  }
}