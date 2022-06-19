import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:peter_seboyeng_module5/winners.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController appCategoryController = TextEditingController();
    TextEditingController appNameController = TextEditingController();
    TextEditingController appYearAwardController = TextEditingController();

    Future _addWinner() {
      final name = nameController.text;
      final appCat = appCategoryController.text;
      final appName = appNameController.text;
      final appYearAward = appYearAwardController.text;

      final ref = FirebaseFirestore.instance.collection('winners').doc();
      return ref
          .set({
            "winner_name": name,
            "app_category": appCat,
            "app_name": appName,
            "year_award": appYearAward,
            "id": ref.id
          })
          .then((value) => log("Collection added"))
          .catchError((onError) => log(onError));
    }

    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    helperText: 'Enter name of past MTN Biz Awards Winner'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                  controller: appCategoryController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      helperText: 'Enter the App category')),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                    controller: appNameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        helperText: 'Enter Name of the App'))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: appYearAwardController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    helperText: 'Enter year awarded'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    _addWinner();
                  },
                  child: const Text('Add Winner')),
            ),
          ],
        ),
        const Winners()
      ],
    );
  }
}
