import 'package:flutter/material.dart';

class CatCardioligost extends StatefulWidget {
  const CatCardioligost({super.key});

  @override
  State<CatCardioligost> createState() => _CatCardioligostState();
}

class _CatCardioligostState extends State<CatCardioligost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Кардиолог'),
        backgroundColor: Color(0xFF0C84FF),
      ),
    );
  }
}
