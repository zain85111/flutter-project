// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseDB extends StatelessWidget {
//   const FirebaseDB({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Flutter Firebase"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           FirebaseFirestore.instance.collection("testing").add({
//             'title': "Zain",
//             'timestamp': Timestamp.fromDate(DateTime.now()),
//           });
//         },
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("testing").snapshots(),
//         builder: (
//           BuildContext context,
//           AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
//         ) {
//           if (!snapshot.hasData) {
//             return const SizedBox.shrink();
//           }
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (BuildContext context, int index) {
//               final docData = snapshot.data!.docs[index].data();
//               final dateTIme = (docData['timestamp'] as Timestamp).toDate();
//               final title = docData['title'];
//               return ListTile(
//                 title: Text(title.toString()),
//                 subtitle: Text(dateTIme.toString()),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
