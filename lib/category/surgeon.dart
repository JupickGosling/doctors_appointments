import 'package:flutter/material.dart';

class CatSurgeon extends StatefulWidget {
  const CatSurgeon({super.key});

  @override
  State<CatSurgeon> createState() => _CatSurgeonState();
}

class _CatSurgeonState extends State<CatSurgeon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Хирург'),
        backgroundColor: Color(0xFF0C84FF),
      ),
    );
  }
}
