import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateWinner extends StatefulWidget {
  const UpdateWinner({Key? key}) : super(key: key);

  @override
  State<UpdateWinner> createState() => _UpdateWinnerState();
}

class _UpdateWinnerState extends State<UpdateWinner> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController appCategoryController = TextEditingController();
    TextEditingController appNameController = TextEditingController();
    TextEditingController appYearAwardController = TextEditingController();

    Future _updateWinner() {
      final name = nameController.text;
      final appCat = appCategoryController.text;
      final appName = appNameController.text;
      final appYearAward = appYearAwardController.text;

      final ref = FirebaseFirestore.instance.collection('winners').doc();
      return ref
          .update({})
          .then((value) => log("Updated"))
          .catchError((onError) => log(onError));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Winner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    helperText: 'Name of the App'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: appCategoryController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    helperText: 'App Category'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: appNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    helperText: 'Name of the App'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: appYearAwardController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    helperText: 'Year awarded'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print('UPDATE WINNER');
                },
                child: const Text("UPDATE"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
