import 'package:doctors_appointments/colors.dart';
import 'package:doctors_appointments/colors.dart';
import 'package:doctors_appointments/components/button.dart';
import 'package:doctors_appointments/components/textField.dart';
import 'package:doctors_appointments/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  RegisterScreen({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passworController = TextEditingController();
  final ageController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passworController.dispose();
    ageController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    super.dispose();
  }

  Future signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passworController.text,
      );
      addUserDetails(
        lastNameController.text,
        firstNameController.text,
        emailController.text,
        int.parse(ageController.text),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorEmail();
      } else if (e.code == 'wrong-password') {
        errorPassword();
      }
    }
    Navigator.pop(context);
  }

  Future addUserDetails(
      String lastName, String firstName, String email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Last name': lastName,
      'First name': firstName,
      'email': email,
      'age': age,
    });
  }

  void alertErrorEmail() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Пользователь с таким email не зарегистрирован!',
    );
  }

  void alertErrorPassword() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Неверный пароль',
    );
  }

  void errorEmail() {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Что-то пошло не так!\n',
        message: 'Пользователь с таким email не зарегистрирован!',
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void errorPassword() {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Что-то пошло не так!\n',
        message: 'Неверный пароль.',
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Welcome!",
                style: TextStyle(
                  color: gColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: lastNameController,
                hintText: "Фамилия",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: firstNameController,
                hintText: "Имя",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: ageController,
                hintText: "Возраст",
                obscureText: false,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: passworController,
                hintText: "Пароль",
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 25),
              MyButton(
                text: "Зарегистрироваться",
                onTap: signUserUp,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Уже есть аккаунт?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Войти.",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
