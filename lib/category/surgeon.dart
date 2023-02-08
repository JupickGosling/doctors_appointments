import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../components/get_doctors.dart';
import '../screens/appoint_screen.dart';

class CatSurgeon extends StatefulWidget {
  const CatSurgeon({super.key});

  @override
  State<CatSurgeon> createState() => _CatSurgeonState();
}

class _CatSurgeonState extends State<CatSurgeon> {
  final doctor = FirebaseFirestore.instance.collection("doctors");

  final int index = 0;

  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection("doctors")
        .where("Specialist", isEqualTo: "Хирург")
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9E4EE),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Список хирургов'),
        backgroundColor: const Color(0xFF0C84FF),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                          leading: Image.asset("images/doctor (5).png"),
                          title: GetDoctors(documentId: docIDs[index]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AppointScreen(documentId: docIDs[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
