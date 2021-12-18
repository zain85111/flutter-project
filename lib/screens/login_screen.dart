// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              // ignore: deprecated_member_use
              child: ElevatedButton(
                child: const Text(
                  'LogIn',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () async {
                  await authService.signIn(
                      emailController.text, passwordController.text);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              // ignore: deprecated_member_use
              child: ElevatedButton(
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
