// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const PrimeNumberCheckerApp());
}

class PrimeNumberCheckerApp extends StatelessWidget {
  const PrimeNumberCheckerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PrimeNumberCheckerScreen(),
    );
  }
}

class PrimeNumberCheckerScreen extends StatefulWidget {
  const PrimeNumberCheckerScreen({super.key});

  @override
  _PrimeNumberCheckerScreenState createState() =>
      _PrimeNumberCheckerScreenState();
}

class _PrimeNumberCheckerScreenState extends State<PrimeNumberCheckerScreen> {
  final TextEditingController _numberController = TextEditingController();
  String _resultText = '';

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  void _checkPrimeNumber() {
    int number = int.tryParse(_numberController.text) ?? 0;
    if (isPrime(number)) {
      setState(() {
        _resultText = 'Số $number là số nguyên tố.';
      });
    } else {
      setState(() {
        _resultText = 'Số $number không là số nguyên tố.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiểm tra số nguyên tố'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nhập số'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _checkPrimeNumber,
              child: const Text('Kiểm tra'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _resultText,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}