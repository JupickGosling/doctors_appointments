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
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${data['Surname']}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: pColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 3),
                    Text(
                      "${data['Firstname']}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: pColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 3),
                    Text(
                      "${data['Patronymic']}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: pColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(children: [
                  const SizedBox(height: 5),
                  Text(
                    "${data['Specialist']}",
                    style: TextStyle(
                      fontSize: 15,
                      color: bColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 17,
                  ),
                  Text(
                    "${data['Rating']}",
                    style: TextStyle(
                      fontSize: 15,
                      color: bColor.withOpacity(0.6),
                    ),
                  ),
                ])
              ],
            ),
          );
        }
        return const Text('loading..');
      }),
    );
  }
}
