import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class GetAppoints extends StatelessWidget {
  GetAppoints({required this.appointId});

  final String appointId;

  @override
  Widget build(BuildContext context) {
    CollectionReference doctors =
        FirebaseFirestore.instance.collection("appointments");

    return FutureBuilder<DocumentSnapshot>(
      future: doctors.doc(appointId).get(),
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
                      "${data['doctor']}",
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
                    "${data['date']}" + " " + "${data['time']}",
                    style: TextStyle(
                      fontSize: 15,
                      color: bColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.check_box,
                    color: Colors.green,
                    size: 17,
                  ),
                  Text(
                    "${data['status']}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
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
