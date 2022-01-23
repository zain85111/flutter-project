// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();

  void click() {
    FirebaseFirestore.instance.collection("items").add({
      'title': controller.text,
      'timestamp': Timestamp.fromDate(DateTime.now()),
    });
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          FlatButton(
            child: const Text('Logout'),
            onPressed: () async {
              await authService.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("items").snapshots(),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
            ) {
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final docData = snapshot.data!.docs[index].data();
                  final dateTIme = (docData['timestamp'] as Timestamp).toDate();
                  final title = docData['title'];
                  return ListTile(
                    title: Text(title.toString()),
                    subtitle: Text(dateTIme.toString()),
                  );
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.shopping_cart_rounded),
                labelText: "Enter Item ",
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
            padding: EdgeInsets.all(5),
            child: FloatingActionButton(
              onPressed: () => click(),
              child: Icon(Icons.add),
              tooltip: "Add",
            ),
          ),
        ],
      ),
    );
  }
}
