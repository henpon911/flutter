import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'page_dashboard.dart';

class PageLogin extends StatefulWidget {
    const PageLogin({super.key});

    @override
    State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
    final TextEditingController TxUsername = TextEditingController();
    final TextEditingController TxPassword = TextEditingController();

    bool loading = false;

    Future<void> prosesLogin() async {
        setState(() {
            loading = true;
        });

        try {
            final response = await http.post(
                Uri.parse('http://localhost:3000/login'),
                headers: {
                    'Content-Type': 'application/json',
                },
                body: jsonEncode({
                    'username': TxUsername.text,
                    'password': TxPassword.text,
                }),
            );

            final data = jsonDecode(response.body);

            if (!mounted) return;

            if (response.statusCode == 200 && data['status'] == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(data['message'] ?? 'Login berhasil')),
                );

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PageDashboard(),
                    ),
                );
            } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(data['message'] ?? 'Login gagal'),
                    ),
                );
            }
        } catch (e) {
            if (!mounted) return;

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Gagal menghubungi API: $e')),
            );
        } finally {
            if (mounted) {
                setState(() {
                    loading = false;
                });
            }
        }
    }

    @override
    void dispose() {
        TxUsername.dispose();
        TxPassword.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.lightBlue,
            body: Center(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            const Icon(
                                Icons.supervised_user_circle,
                                size: 80,
                            ),
                            const SizedBox(height: 15),
                            const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            const SizedBox(height: 25),
                            TextField(
                                controller: TxUsername,
                                decoration: const InputDecoration(
                                    labelText: 'Input Username',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white,
                                ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                                controller: TxPassword,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    labelText: 'Input Password',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white,
                                ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: loading ? null : prosesLogin,
                                    child: Text(loading ? 'Memproses...' : 'Login'),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}