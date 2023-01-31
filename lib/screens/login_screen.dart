import 'package:doctors_appointments/colors.dart';
import 'package:doctors_appointments/colors.dart';
import 'package:doctors_appointments/components/button.dart';
import 'package:doctors_appointments/components/textField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = TextEditingController();
  final passworController = TextEditingController();

  void SignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(height: 80),
            Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(height: 30),
            Text(
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
              controller: loginController,
              hintText: "Login",
              obscureText: false,
            ),
            const SizedBox(height: 20),
            MyTextField(
              controller: passworController,
              hintText: "Password",
              obscureText: true,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Забыли пароль?",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            MyButton(onTap: SignIn),
          ]),
        ),
      ),
    );
  }
}
