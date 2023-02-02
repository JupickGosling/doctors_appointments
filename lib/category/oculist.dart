import 'package:flutter/material.dart';

class CatOculist extends StatefulWidget {
  const CatOculist({super.key});

  @override
  State<CatOculist> createState() => _CatOculistState();
}

class _CatOculistState extends State<CatOculist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Окулист'),
        backgroundColor: Color(0xFF0C84FF),
      ),
    );
  }
}
