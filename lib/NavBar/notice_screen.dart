import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointments/components/get_appoint.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../colors.dart';

class NoticeTab extends StatefulWidget {
  const NoticeTab({super.key});

  @override
  State<NoticeTab> createState() => _NoticeTabState();
}

class _NoticeTabState extends State<NoticeTab> {
  final int index = 0;

  List<String> appointIDs = [];

  Future getAppontId() async {
    await FirebaseFirestore.instance
        .collection('appointments')
        .where('user', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              appointIDs.add(document.reference.id);
            },
          ),
        );
  }

  void _delete(String appointId) async {
    await FirebaseFirestore.instance
        .collection('appointments')
        .doc(appointId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9E4EE),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Список записей'),
        backgroundColor: const Color(0xFF0C84FF),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: FutureBuilder(
              future: getAppontId(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: appointIDs.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane:
                          ActionPane(motion: const BehindMotion(), children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: "Отменить",
                          onPressed: (context) {
                            _delete(appointIDs[index]);
                          },
                        )
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: sdColor,
                                blurRadius: 6,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: Icon(Icons.calendar_month),
                            title: Transform.translate(
                              offset: Offset(-25, 0),
                              child: GetAppoints(appointId: appointIDs[index]),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
