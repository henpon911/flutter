
import 'package:flutter/material.dart';

class app_baris extends StatelessWidget {
  const app_baris({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data berhasil disimpan!'),
              ),
            );
          },
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}