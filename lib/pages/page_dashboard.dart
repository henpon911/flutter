
import 'package:flutter/material.dart';

class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,

      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang di Dashboard',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Lihat Data'),
            ),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Tambah Data'),
            ),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Update Data'),
            ),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Hapus Data'),
            ),
          ],
        ),
      ),
    );
  }
}
