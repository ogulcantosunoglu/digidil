import 'package:digidil/digidil_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  /* Firebase'i projeye eklediğimiz yer */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(DigidilApp()); // MaterialApp class'ı ile uygulamayı başlatıyoruz.
}
