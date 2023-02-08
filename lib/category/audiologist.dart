import 'package:flutter/material.dart';

class CatAudiologist extends StatefulWidget {
  const CatAudiologist({super.key});

  @override
  State<CatAudiologist> createState() => _CatAudiologistState();
}

class _CatAudiologistState extends State<CatAudiologist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Отоларинголог'),
        backgroundColor: Color(0xFF0C84FF),
      ),
      body: Container(
        color: const Color(0xFFD9E4EE),
      ),
    );
  }
}
