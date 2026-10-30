
import 'package:flutter/material.dart';
import 'package:untitled/pages/page_input.dart';
import 'package:untitled/pages/page_dashboard.dart';
import 'package:untitled/pages/page_login.dart';
import 'app_bar.dart';
import 'app_kolom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PageLogin(),
    );
  }
}