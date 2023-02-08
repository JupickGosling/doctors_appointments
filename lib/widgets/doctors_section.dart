import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointments/colors.dart';
import 'package:doctors_appointments/components/get_doctors2.dart';
import 'package:doctors_appointments/screens/appoint_screen.dart';
import 'package:flutter/material.dart';

import '../components/get_doctors.dart';

class DoctorsSection extends StatefulWidget {
  const DoctorsSection({super.key});
  @override
  State<DoctorsSection> createState() => _DoctorsSectionState();
}

class _DoctorsSectionState extends State<DoctorsSection> {
  final int index = 0;

  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection("doctors").get().then(
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
    return Container(
      height: 340,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: docIDs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F8FF),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: sdColor,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AppointScreen(
                                              documentId: docIDs[index]),
                                        ));
                                  },
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset(
                                      "images/doctor (5).png",
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFF2F8FF),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: sdColor,
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                          )
                                        ]),
                                    child: const Center(
                                      child: Icon(
                                        Icons.favorite_outline,
                                        color: pColor,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: ListTile(
                                title: GetDoctors2(documentId: docIDs[index]),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AppointScreen(
                                          documentId: docIDs[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
