import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:peter_seboyeng_module5/winners.dart';

class WinnerDetail extends StatelessWidget {
  final DocumentSnapshot documentSnapShot;

  const WinnerDetail({Key? key, required this.documentSnapShot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${documentSnapShot["year_award"]} - ${documentSnapShot["app_name"]}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Center(
                widthFactor: MediaQuery.of(context).size.height * 0.80,
                child: Column(
                  children: [
                    Text(
                      "Winner : " + documentSnapShot["winner_name"],
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                    Text(
                      "Category : " + documentSnapShot["app_category"],
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.deepOrange.shade600,
                          letterSpacing: 2.0),
                    ),
                    Text(
                      "App Name : " + documentSnapShot["app_name"],
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.deepOrange.shade600,
                          letterSpacing: 2.0),
                    ),
                    Text(
                      "Year : " + documentSnapShot["year_award"],
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.deepOrange.shade600,
                          letterSpacing: 2.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          final docRef = FirebaseFirestore.instance
                              .collection("winners")
                              .doc(documentSnapShot["id"]);
                          docRef.update({
                            "winner_name": "",
                            "app_category": "",
                            "app_name": "",
                            "year_award": ""
                          });
                        },
                        child: const Text("EDIT"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          final docRef = FirebaseFirestore.instance
                              .collection("winners")
                              .doc(documentSnapShot["id"]);
                          docRef.delete();
                          Navigator.pop(context);
                        },
                        child: const Text("DELETE"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
