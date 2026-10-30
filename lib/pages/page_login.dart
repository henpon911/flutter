
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
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    bool loading = false;

    Future<void> login() async {
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
                    'username': usernameController.text,
                    'password': passwordController.text,
                }),
            );

            final data = jsonDecode(response.body);

            if (!mounted) return;

            if (response.statusCode == 200 && data['status'] == true) {
                Navigator.push(
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
                const SnackBar(
                    content: Text('Gagal menghubungi API'),
                ),
            );
        }

        if (mounted) {
            setState(() {
                loading = false;
            });
        }
    }

    @override
    void dispose() {
        usernameController.dispose();
        passwordController.dispose();
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
                                color: Colors.white,
                            ),

                            const SizedBox(height: 20),

                            const Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),
                            ),

                            const SizedBox(height: 30),

                            TextField(
                                controller: usernameController,
                                decoration: const InputDecoration(
                                    labelText: 'Input Username',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white,
                                ),
                            ),

                            const SizedBox(height: 20),

                            TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    labelText: 'Input Password',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white,
                                ),
                            ),

                            const SizedBox(height: 30),

                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: loading ? null : login,
                                    child: loading
                                        ? const CircularProgressIndicator()
                                        : const Text('LOGIN'),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
