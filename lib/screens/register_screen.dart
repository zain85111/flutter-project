// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
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
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: conPasswordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Confirm Password",
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
                  'Register',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
