import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digidil/models/word.dart';

class WordService {
  FirebaseFirestore _instance;

  List<Word> _words = [];

  Future<void> getWordsCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference words = _instance.collection('digidil_data');

    DocumentSnapshot snapshot = await words.doc('words').get();

    var data = snapshot.data() as Map;
    var wordsData = data['words'] as List<dynamic>;

    wordsData.forEach((data) {
      _words.add(Word.fromJson(data)); // Alınan verileri class'lara çevir
    });
  }

  List<Word> getWords() {
    return _words;
  }
}
