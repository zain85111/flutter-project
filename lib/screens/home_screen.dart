// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
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
              onPressed: () async {
                await authService.signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
