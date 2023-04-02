import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('child widget'),
          elevated(
              onPressed: () {
                getData();
              },
              label: 'Button One')
        ],
      )),
    );
  }

  ElevatedButton elevated(
      {required Function() onPressed, required String label}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  void getData() {
    db
        .collection('courses')
        .orderBy('seqNo', descending: true)
        .limit(1)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        doc.data()['description'] != null
            ? print(doc.data()['description'])
            : null;
      }
    });
  }
}
