// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/colors.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({
    super.key,
  });

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    String email = _emailController.text;

    _emailController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Успешная регистрация'),
        content: Text('Пользователь с email $email успешно зарегистрирован.'),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('ОК'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Пароль',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                  onPressed: _register,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(greenColor),
                  ),
                  child: const Text('Зарегистрироваться'),
                ),
              ),
            ),
          ],
        ),
      );
}
