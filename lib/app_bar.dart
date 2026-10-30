
import 'package:flutter/material.dart';
import 'package:untitled/app_baris.dart';
import 'app_kolom.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Flutter'),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: const Center(
        child: app_baris(),
      ),
    );
  }
}