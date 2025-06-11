// import 'package:flutter_task_13/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_13/project/bottom_nav.dart/bottom_nav.dart';
// import 'package:flutter_task_13/project/home_screen/edit_cart.dart';
// import 'package:flutter_task_13/project/home_screen/home_screen.dart';
// import 'package:flutter_task_13/project/home_screen/edit_cart.dart';
import 'package:flutter_task_13/project/login.dart';
import 'package:flutter_task_13/project/register.dart';
import 'package:flutter_task_13/project/splash/splas.dart';
import 'package:flutter_task_13/project/splash/splas_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/Splash': (context) => Splash(),
        BottomNav.id: (context) => BottomNav(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffE7EFC7)),
      ),
      // home: const SplashScreen(),
    );
  }
}
