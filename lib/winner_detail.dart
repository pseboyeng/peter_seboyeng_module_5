import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:peter_seboyeng_module5/update_winner.dart';
import 'package:peter_seboyeng_module5/winners.dart';

class WinnerDetail extends StatefulWidget {
  final DocumentSnapshot documentSnapShot;

  const WinnerDetail({Key? key, required this.documentSnapShot})
      : super(key: key);

  @override
  State<WinnerDetail> createState() => _WinnerDetailState();
}

class _WinnerDetailState extends State<WinnerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.documentSnapShot["year_award"]} - ${widget.documentSnapShot["app_name"]}"),
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
                      "Winner : " + widget.documentSnapShot["winner_name"],
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                    Text(
                      "Category : " + widget.documentSnapShot["app_category"],
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.deepOrange.shade600,
                          letterSpacing: 2.0),
                    ),
                    Text(
                      "App Name : " + widget.documentSnapShot["app_name"],
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.deepOrange.shade600,
                          letterSpacing: 2.0),
                    ),
                    Text(
                      "Year : " + widget.documentSnapShot["year_award"],
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
                          String id = widget.documentSnapShot['id'];
                          String winnerName =
                              widget.documentSnapShot['winner_name'];
                          String appCategory =
                              widget.documentSnapShot['app_category'];
                          String appName = widget.documentSnapShot['app_name'];
                          String yearAward =
                              widget.documentSnapShot['year_award'];
                          //final docRef = FirebaseFirestore.instance.collection("winners").doc(documentSnapShot["id"]);
                          //docRef.update({"winner_name": "", "app_category": "", "app_name": "", "year_award": ""});
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateWinner(
                                      id: id,
                                      winnerName: winnerName,
                                      appCategory: appCategory,
                                      appName: appName,
                                      yearAward: yearAward)));
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
                              .doc(widget.documentSnapShot["id"]);
                          docRef.delete();
                          Navigator.pop(context);
                        },
                        child: const Text("DELETE"),
                      ),
                    ),
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
