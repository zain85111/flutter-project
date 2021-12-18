// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("This is Home Screen"),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                // Navigator.pushNamed(context, '/login');
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
