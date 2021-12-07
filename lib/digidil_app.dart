import 'package:digidil/screens/main_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class DigidilApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DigidilAppState();
  }
}

class DigidilAppState extends State<DigidilApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: getToken(),
        builder: (context, snapshot) => buildApp(context, snapshot),
      ),
    );
  }

  buildApp(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      print("ERROR on Building App! ${snapshot.error.toString()}");
      return Center(
        child: Text(
          snapshot.error.toString(),
          style: TextStyle(
            fontSize: 8,
            color: Colors.white,
          ),
        ),
      );
    } else if (snapshot.hasData) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        home: MainScreen(),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Future getToken() async {
    try {
      String token = await FirebaseMessaging.instance.getToken();

      print(token);
      return token;
    } catch (error) {
      print(error);
      return "error";
    }
  }
}
