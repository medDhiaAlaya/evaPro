import 'package:evapro/controllers/authController.dart';
import 'package:evapro/screens/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                controller: passwordController,
                obscureText: true,
              ),
              FilledButton(
                child: Text("Log In"),
                onPressed: () {
                  controller.login(
                      emailController.text, passwordController.text);
                },
              ),
              FilledButton(
                child: Text("Sign Up"),
                onPressed: () {
                  Get.to(RegisterScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}