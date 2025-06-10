// import 'package:andippkd_mpro_b2/meet_enam/tugas_enam_flutter.dart';
// import 'package:andippkd_mpro_b2/input_widget/input_widget.dart';
// import 'package:andippkd_mpro_b2/meet_delapan/tugas_delapan_flutter.dart';
// import 'package:andippkd_mpro_b2/meet_sembilan/tugas_sembilan_c.dart';
// import 'package:andippkd_mpro_b2/meet_sembilan/tugas_sembilan_b.dart';
// import 'package:andippkd_mpro_b2/meet_sembilan/tugas_sembilan_flutter.dart';
// import 'package:andippkd_mpro_b2/meet_tujuh/tugas_tujuh_flutter.dart';
// import 'package:andippkd_mpro_b2/splash_screen/splash.dart';
// import 'package:andippkd_mpro_b2/meet_enam/tugas_enam_flutter.dart';
// import 'package:andippkd_mpro_b2/meet_sepuluh/tugas_sepuluh_flutter.dart';
// import 'package:flutter_task_13/splash_screen/splash.dart';
// import 'package:andippkd_mpro_b2/study_case/uiSiswa.dart';
// import 'package:andippkd_mpro_b2/tugas_sebelas/tugas_sebelas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_13/project/home_screen/home_screen.dart';
import 'package:flutter_task_13/project/login.dart';
import 'package:flutter_task_13/project/register.dart';
import 'package:flutter_task_13/project/splash/splas.dart';
// import 'package:flutter_task_13/project/splash/splas_2.dart';

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
        '/': (context) => HomeScreen(),
        '/Splash': (context) => Splash(),
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 114, 198, 231),
        ),
      ),
      // home: const SplashScreen(),
    );
  }
}
