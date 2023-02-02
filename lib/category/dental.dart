import 'package:flutter/material.dart';

class CatDant extends StatefulWidget {
  const CatDant({super.key});

  @override
  State<CatDant> createState() => _CatDantState();
}

class _CatDantState extends State<CatDant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Стомалотог'),
        backgroundColor: Color(0xFF0C84FF),
      ),
    );
  }
}
