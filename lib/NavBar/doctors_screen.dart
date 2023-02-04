import 'package:flutter/material.dart';

import '../components/doctor_card.dart';

class DoctorTab extends StatefulWidget {
  const DoctorTab({super.key});

  @override
  State<DoctorTab> createState() => _DoctorTabState();
}

class _DoctorTabState extends State<DoctorTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Список докторов'),
          backgroundColor: Color(0xFF0C84FF),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(5, (index) {
              return DoctorCard();
            }),
          ),
        ));
  }
}
