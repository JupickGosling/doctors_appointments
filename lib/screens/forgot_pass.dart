import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:doctors_appointments/colors.dart';
import 'package:doctors_appointments/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final controller = TextEditingController();

  void resetPass() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: controller.text,
      );
      successEmail();
    } on FirebaseAuthException catch (e) {
      errorEmail();
    }
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

  void successEmail() {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Успешно\n',
        message: 'Ссылка для восстановления пароля отправлена на email',
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0C84FF),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Введите ваш email",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: wColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: pColor),
                ),
                fillColor: gsColor,
                filled: true,
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey[500]),
              ),
            ),
          ),
          SizedBox(height: 10),
          MyButton(
            text: "Отправить письмо",
            onTap: resetPass,
          ),
        ],
      ),
    );
  }
}
