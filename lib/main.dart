import 'package:digidil/screens/main_screen.dart';
import 'package:digidil/services/word_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  /* Firebase'i projeye eklediğimiz yer */
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          // Firestore Provider
          create: (_) => WordService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        initialRoute: '/mainscreen',
        routes: {
          '/mainscreen': (context) => MainScreen(),
        },
      ),
    ),
  );
}
