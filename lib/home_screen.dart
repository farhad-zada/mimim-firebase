import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './city.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  List<City> cities = [
    const City(
      name: 'Masalli',
      state: 'Talish',
      country: 'Azerbaijan',
      population: 289,
      capital: true,
      regions: ['Zuvand', 'Istisu'],
    ),
    const City(
      name: 'Baku',
      state: 'Absheron',
      country: 'Azerbaijan',
      population: 129289,
      capital: true,
      regions: ['Sabunchu', 'Icheri sheher'],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            elevatedButton(
                color: Colors.teal,
                title: 'get snap',
                onPressed: () {
                  final doc = db.doc('cities/BJ').snapshots();
                  print(doc.listen((event) {
                    print(event);
                  }));
                }),
            elevatedButton(
              title: 'get data',
              onPressed: () {
                final docRef = db
                    .collection('cities')
                    .where('population', isLessThan: 1000000)
                    .where('capital', isEqualTo: false)
                    .orderBy('population')
                    .get()
                    .then(
                  (QuerySnapshot querySnapshot) {
                    for (var doc in querySnapshot.docs) {
                      final data = doc.data() as Map<String, dynamic>;
                      print(data['population']);
                    }
                  },
                );
              },
            ),
            elevatedButton(
              color: Colors.green.shade900,
              title: 'get nested',
              onPressed: () {
                db
                    .collection('cities')
                    .doc('v4dro0WLSg54EY6fRfNo')
                    .collection('name')
                    .get()
                    .then((value) {
                  for (var docSnap in value.docs) {
                    var data = docSnap.data();
                    print(data);
                  }
                });
              },
            ),
            elevatedButton(
              color: Colors.green.shade700,
              title: 'go back',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton elevatedButton(
      {Color color = Colors.red, Function()? onPressed, String? title}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 12,
        backgroundColor: color,
      ),
      child: Text(
        title!,
      ),
    );
  }
}
