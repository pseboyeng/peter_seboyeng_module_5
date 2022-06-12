import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Winners extends StatefulWidget {
  const Winners({Key? key}) : super(key: key);

  @override
  State<Winners> createState() => _WinnersState();
}

class _WinnersState extends State<Winners> {
  final Stream<QuerySnapshot> _winners =
      FirebaseFirestore.instance.collection("winners").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _winners,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
        if (snapshot.hasError) {
          return const Text("Oops! Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          return Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height),
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: snapshot.data!.docs
                        .map((DocumentSnapshot documentSnapShot) {
                          Map<String, dynamic> data =
                              documentSnapShot.data() as Map<String, dynamic>;
                          return ListTile(
                            title: Text(data['winner_name']),
                            subtitle: Text(data['app_name']),
                          );
                        })
                        .toList()
                        .cast(),
                  ),
                ),
              )
            ],
          );
        } else {
          return (const Text('No data'));
        }
      },
    );
  }
}
