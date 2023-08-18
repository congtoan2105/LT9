import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Test Home Page'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn//News/0//may-tinh-cam-tay-3-800x450.jpg',
                width: 220,
              ),
              const SizedBox(
                height: 20,
              ),
              buildInputFields(controllerA, 'Nhập vào A'),
              const SizedBox(height: 10),
              buildInputFields(controllerB, 'Nhập vào B'),
              const SizedBox(height: 20),
              Text(
                'Kết quả là: $result',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              buildCalculationButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputFields(TextEditingController controller, String hintText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {}); // Trigger a rebuild to update the result text
            },
            decoration: InputDecoration(
              labelText: controller.text.isEmpty ? hintText : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCalculationButtons(BuildContext context) {
    const operators = {'+': '+', '-': '-', '*': '*', '%': '%'};

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var operator in operators.keys)
          ElevatedButton(
            onPressed: () => performCalculation(context, operator),
            child: Text(operator),
          ),
        const SizedBox(width: 10),
      ],
    );
  }

  void performCalculation(BuildContext context, String operator) {
    double a = double.tryParse(controllerA.text) ?? 0;
    double b = double.tryParse(controllerB.text) ?? 0;

    setState(() {
      if (operator == '+') {
        result = a + b;
      } else if (operator == '-') {
        result = a - b;
      } else if (operator == '*') {
        result = a * b;
      } else if (operator == '%') {
        result = a / b;
      } else {
        result = 0;
      }
    });
  }
}