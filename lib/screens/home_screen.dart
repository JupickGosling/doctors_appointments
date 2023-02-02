import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointments/category/dental.dart';
import 'package:doctors_appointments/colors.dart';
import 'package:doctors_appointments/screens/welcome_screen.dart';
import 'package:doctors_appointments/widgets/category_secrion.dart';
import 'package:doctors_appointments/widgets/doctors_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    List<String> docIDs = [];

    Future getDocId() async {
      await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach(
              (document) {
                print(document.reference);
                docIDs.add(document.reference.id);
              },
            ),
          );
    }

    return Scaffold(
      backgroundColor: Color(0xFFD9E4EE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      pColor.withOpacity(0.8),
                      pColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage("images/user.png"),
                              ),
                              const SizedBox(width: 190),
                              const Icon(
                                Icons.notifications_outlined,
                                color: wColor,
                                size: 30,
                              ),
                              IconButton(
                                onPressed: signUserOut,
                                icon: const Icon(Icons.logout_outlined),
                                color: wColor,
                                iconSize: 30,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Hi, Programmer',
                            style: TextStyle(
                              color: wColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Ваше Здоровье – Наш\nГлавный Приоритет",
                            style: TextStyle(
                              color: wColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 20),
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: wColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: sdColor,
                                  blurRadius: 6,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Поиск...",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Категории",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: bColor.withOpacity(0.7),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    CategorySection(),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text("Рекомендуемые врачи",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: bColor.withOpacity(0.7),
                          )),
                    ),
                    DoctorsSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
