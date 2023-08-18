import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.amber,
    Colors.grey
  ];
  Color backgroundColor = Colors.white;

  // ignore: non_constant_identifier_names
  void Counter() {
    setState(() {
      counter++;
      if (counter % 2 == 0) {
        backgroundColor = getRandomColor();
      }
    });
  }

  Color getRandomColor() {
    Random random = Random();
    return colors[random.nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Homework'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Counter();
          },
          child: const Text('Click me to change background color!'),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}