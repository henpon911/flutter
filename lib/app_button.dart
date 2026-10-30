
import 'package:flutter/material.dart';

class app_button extends StatelessWidget {
  const app_button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil disimpan!')),
        );
      },
      child: const Text('Simpan'),
    );
  }
}