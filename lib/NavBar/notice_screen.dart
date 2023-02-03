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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Уведомления'),
        backgroundColor: Color(0xFF0C84FF),
      ),
    );
  }
}