import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class GetDoctorsSub extends StatelessWidget {
  GetDoctorsSub({required this.documentId});

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
          // return Text(
          //   "${data['Specialist']}\n" + " " + "${data['Rating']}\n",
          //   style: TextStyle(
          //     fontSize: 18,
          //     color: bColor.withOpacity(0.6),
          //   ),
          // );
          return Row(
            children: [
              Text(
                "${data['Specialist']}",
                style: TextStyle(
                  fontSize: 18,
                  color: bColor.withOpacity(0.6),
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(width: 5),
              Text(
                "${data['Rating']}",
                style: TextStyle(
                  fontSize: 16,
                  color: bColor.withOpacity(0.6),
                ),
              ),
            ],
          );
        }
        return Text('loading..');
      }),
    );
  }
}
