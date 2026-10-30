import 'app_button.dart';
import 'package:flutter/material.dart';

class appbody extends StatelessWidget {
  const appbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue.shade100,
      width: double.infinity,
      child: const Center(
        child: Text(
          'Selamat Datang!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}