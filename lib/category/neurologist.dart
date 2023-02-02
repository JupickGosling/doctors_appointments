import 'package:flutter/material.dart';

class CatNeurologist extends StatefulWidget {
  const CatNeurologist({super.key});

  @override
  State<CatNeurologist> createState() => _CatNeurologistState();
}

class _CatNeurologistState extends State<CatNeurologist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Невролог'),
        backgroundColor: Color(0xFF0C84FF),
      ),
    );
  }
}
