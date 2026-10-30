import 'package:flutter/material.dart';

class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('dashboard'),

              const SizedBox(height: 20),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('lihat data'),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('update data'),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('tambah data'),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('hapus data'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}