import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class GetDoctors extends StatelessWidget {
  GetDoctors({required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference doctors =
        FirebaseFirestore.instance.collection("doctors");

    return FutureBuilder<DocumentSnapshot>(
      future: doctors.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "${data['Surname']}" +
                " " +
                "${data['Firstname']}" +
                " " +
                "${data['Patronymic']}",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: pColor,
            ),
          );
        }
        return Text('loading..');
      }),
    );
  }
}
