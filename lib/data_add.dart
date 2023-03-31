import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataAddition extends StatefulWidget {
  const DataAddition({super.key});

  @override
  State<DataAddition> createState() => _DataAdditionState();
}

class _DataAdditionState extends State<DataAddition> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _firebaseFirestore.collection('cities').add({'name': 'x'}).then(
                (value) {
                  _firebaseFirestore
                      .collection('cities')
                      .doc(value.id)
                      .collection('name')
                      .add({'data': null});
                },
                onError: (error) => print(error),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 12,
              backgroundColor: Colors.yellow.shade800,
            ),
            child: const Text(
              'nested',
            ),
          ),
          elevatedButton(onPressed: () => populateCities(), title: 'fire-pop'),
          elevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              title: 'go back'),
        ],
      ),
    ));
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

  void populateCities() {
    final cities = _firebaseFirestore.collection("cities");
    final data1 = <String, dynamic>{
      "name": "San Francisco",
      "state": "CA",
      "country": "USA",
      "capital": false,
      "population": 860000,
      "regions": ["west_coast", "norcal"]
    };
    cities.doc("SF").set(data1);

    final data2 = <String, dynamic>{
      "name": "Los Angeles",
      "state": "CA",
      "country": "USA",
      "capital": false,
      "population": 3900000,
      "regions": ["west_coast", "socal"],
    };
    cities.doc("LA").set(data2);

    final data3 = <String, dynamic>{
      "name": "Washington D.C.",
      "state": null,
      "country": "USA",
      "capital": true,
      "population": 680000,
      "regions": ["east_coast"]
    };
    cities.doc("DC").set(data3);

    final data4 = <String, dynamic>{
      "name": "Tokyo",
      "state": null,
      "country": "Japan",
      "capital": true,
      "population": 9000000,
      "regions": ["kanto", "honshu"]
    };
    cities.doc("TOK").set(data4);

    final data5 = <String, dynamic>{
      "name": "Beijing",
      "state": null,
      "country": "China",
      "capital": true,
      "population": 21500000,
      "regions": ["jingjinji", "hebei"],
    };
    cities.doc("BJ").set(data5);
  }

  ElevatedButton addOne(String docId) {
    return ElevatedButton(
      onPressed: () {
        if (docId != '') {
          print(docId);
          _firebaseFirestore.collection('cities').doc(docId).update(
            {
              'name': 'Baku',
              'population': Random().nextInt(50000),
              'timestamp': FieldValue.serverTimestamp(),
            },
          );
        } else {
          _firebaseFirestore.collection('cities').doc().set(
            {
              'name': 'Baku',
              'population': Random().nextInt(50000),
              'timestamp': FieldValue.serverTimestamp(),
            },
          );
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 12,
        backgroundColor: Colors.blue.shade800,
      ),
      child: const Text(
        'add one',
      ),
    );
  }
}
