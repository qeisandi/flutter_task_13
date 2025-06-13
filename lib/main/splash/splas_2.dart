import 'package:flutter/material.dart';
import 'package:flutter_task_13/Helper/prefHelper/prefernce_helper.dart';
import 'package:flutter_task_13/main/splash/splas.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changePage() {
    Future.delayed(Duration(seconds: 3), () async {
      bool isLogin = await PreferenceHandler.getLogin();
      print("isLogin: $isLogin");
      if (isLogin) {
        return Navigator.pushNamedAndRemoveUntil(
          context,
          Splash.id,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "/Splash", (route) => false);
      }
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            // Image.asset(AppImage.pisang),
            SizedBox(height: 20),
            Text(
              "EpruvShop",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color(0xff8A784E),
              ),
            ),
            Spacer(),
            SafeArea(child: Text("v 2.5.0", style: TextStyle(fontSize: 12))),
          ],
        ),
      ),
    );
  }
}
