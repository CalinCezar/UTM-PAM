import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const AngleConverterApp());
}

class AngleConverterApp extends StatelessWidget {
  const AngleConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversie unghiuri',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AngleConverterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AngleConverterScreen extends StatefulWidget {
  const AngleConverterScreen({super.key});

  @override
  State<AngleConverterScreen> createState() => _AngleConverterScreenState();
}

class _AngleConverterScreenState extends State<AngleConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";
  bool _isDegToRad = true; // true = Grade -> Radiani, false = Radiani -> Grade

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) {
      setState(() {
        _result = "Introduceți o valoare validă!";
      });
      return;
    }

    double output;
    if (_isDegToRad) {
      output = input * pi / 180; // grade -> radiani
      _result = "$input° = ${output.toStringAsFixed(4)} rad";
    } else {
      output = input * 180 / pi; // radiani -> grade
      _result = "$input rad = ${output.toStringAsFixed(2)}°";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conversie unghiuri")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Introduceți valoarea unghiului",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text("Grade → Radiani"),
                    value: true,
                    groupValue: _isDegToRad,
                    onChanged: (val) {
                      setState(() {
                        _isDegToRad = val!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text("Radiani → Grade"),
                    value: false,
                    groupValue: _isDegToRad,
                    onChanged: (val) {
                      setState(() {
                        _isDegToRad = val!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: const Text("Convertește"),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
