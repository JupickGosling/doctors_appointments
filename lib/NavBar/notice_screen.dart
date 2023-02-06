import 'package:flutter/material.dart';

class NoticeTab extends StatefulWidget {
  const NoticeTab({super.key});

  @override
  State<NoticeTab> createState() => _NoticeTabState();
}

class _NoticeTabState extends State<NoticeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9E4EE),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Записи'),
        backgroundColor: Color(0xFF0C84FF),
      ),
      body: SafeArea(child: Text("Список записей на прием")),
    );
  }
}
