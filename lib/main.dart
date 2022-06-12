import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peter_seboyeng_module5/create.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC5BXBDYluVyDZQXacjD8JfAkxGD_6F1Mc",
          authDomain: "module5-9c8a4.firebaseapp.com",
          projectId: "module5-9c8a4",
          storageBucket: "module5-9c8a4.appspot.com",
          messagingSenderId: "362773821709",
          appId: "1:362773821709:web:c1bde9ae7cd9afb5a7d844",
          measurementId: "G-2QSG3M4KSQ"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          secondaryHeaderColor: Colors.orange,
          accentColor: Colors.orangeAccent,
          canvasColor: Colors.lightGreenAccent),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[Create()],
          ),
        ),
      ),
    );
  }
}
