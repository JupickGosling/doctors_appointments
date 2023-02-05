import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../screens/login_screen.dart';

class UserTab extends StatefulWidget {
  const UserTab({Key? key}) : super(key: key);

  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль"),
        centerTitle: true,
        backgroundColor: Color(0xFF0C84FF),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("images/user.png"),
              ),
              Text(
                "${loggedInUser.lastname} ${loggedInUser.firstname}",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${loggedInUser.email}",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                label: Text("Logout"),
                onPressed: () {
                  signUserOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
