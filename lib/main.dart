import 'package:bkc_super_app/screens/dashboard.dart';
import 'package:bkc_super_app/screens/pages/data_master/data_master.dart';
import 'package:bkc_super_app/screens/pages/master_data.dart';
import 'package:bkc_super_app/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BKC SUPER BRANCH',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/dashboard': (context) => Dashboard(),
        '/data_master': (context) => MasterData(),
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
      // debugShowCheckedModeBanner: false,
    );
  }
}
