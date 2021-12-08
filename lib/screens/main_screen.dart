import 'package:digidil/data/statics/my_appbars.dart';
import 'package:digidil/data/statics/my_colors.dart';
import 'package:digidil/models/word.dart';
import 'package:digidil/services/word_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //final GlobalKey<State> _keyLoader = GlobalKey<State>();
  final TextEditingController wordController = TextEditingController();

  Word selectedWord = Word(
    word: "Assignment",
    wordType: "Noun | İsim",
    pronunciation: "uh * poynt * muhnt",
    turkishMeaning:
        "Meaning, engagement, date, tryst; Randevu, Atama, Tayin, Görev",
    definitionEN:
        "an arrangement to meet someone at a particular time and place.",
    definitionTR:
        "bir kimseden, belli bir yerde ve belli bir saatte buluşmak için söz almak.",
  );

  FocusNode wordFocusNode;
  List<Word> words = [];

  @override
  void initState() {
    super.initState();

    wordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    WordService wordService = Provider.of<WordService>(context, listen: false);

    return Scaffold(
      appBar: MyAppBars.getDefault(context),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getWordsFromFirestore(context, wordService),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return mainWidget();
          else if (snapshot.hasError)
            return Center(
              child: Text(
                snapshot.error,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: MyColors.tasarimSiyah,
                  fontFamily: "SourceSansPro",
                ),
              ),
            );
          else
            return Center(
              child: CircularProgressIndicator(
                color: MyColors.emopasYesil,
              ),
            );
        },
      ),
    );
  }

  Future getWordsFromFirestore(
    BuildContext context,
    WordService wordService,
  ) async {
    await Firebase.initializeApp().then(
      (value) async =>
          await wordService.getWordsCollectionFromFirebase().then((value) {
        words = wordService.getWords();
      }),
    );

    return "ok";
  }

  mainWidget() {
    return StaggeredGridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 0,
      mainAxisSpacing: 5,
      padding: EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 0.0,
      ),
      children: <Widget>[
        textField(),
        card(),
      ],
      staggeredTiles: [
        StaggeredTile.extent(3, 65),
        StaggeredTile.extent(3, 415),
      ],
    );
  }

  textField() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 0),
      child: TextField(
        onSubmitted: (text) {
          setState(() {
            var word = words.firstWhere(
              (element) => element.word == wordController.text,
            );
            selectedWord = word;
          });
        },
        autofocus: true,
        textInputAction: TextInputAction.done,
        controller: wordController,
        focusNode: wordFocusNode,
        cursorColor: Colors.white,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.black,
          fontFamily: "SourceSansPro",
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 35,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          fillColor: Colors.black,
          focusColor: Colors.black,
          hoverColor: Colors.black,
        ),
      ),
    );
  }

  card() {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: StaggeredGridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 0.0,
        ),
        children: <Widget>[
          word(),
          wordType(),
          turkishMeaning(),
          definition(),
          relationships(),
        ],
        staggeredTiles: [
          StaggeredTile.extent(3, 75),
          StaggeredTile.extent(3, 25),
          StaggeredTile.extent(3, 65),
          StaggeredTile.extent(3, 155),
          StaggeredTile.extent(3, 35),
        ],
      ),
    );
  }

  word() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
          ),
          child: Text(
            selectedWord.word,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: MyColors.tasarimSiyah,
              fontFamily: "SourceSansPro",
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 15,
          ),
          child: Text(
            selectedWord.pronunciation,
            style: TextStyle(
              fontSize: 17,
              color: MyColors.tasarimSiyah,
              fontFamily: "SourceSansPro",
            ),
          ),
        ),
      ],
    );
  }

  wordType() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: 15,
      ),
      child: Text(
        selectedWord.wordType,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: MyColors.tasarimAcikMavi,
          fontFamily: "SourceSansPro",
        ),
      ),
    );
  }

  turkishMeaning() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Text(
            selectedWord.turkishMeaning.split(";")[0],
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: MyColors.tasarimSiyah,
              fontFamily: "SourceSansPro",
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Text(
            selectedWord.turkishMeaning.split(";")[1],
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: MyColors.tasarimSiyah,
              fontFamily: "SourceSansPro",
            ),
          ),
        ),
      ],
    );
  }

  definition() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Text(
            selectedWord.definitionEN,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: MyColors.tasarimAcikMavi,
              fontFamily: "SourceSansPro",
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Text(
            '"she made an appointment with my receptionist"',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: MyColors.tasarimSiyah,
              fontFamily: "SourceSansPro",
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Text(
            selectedWord.definitionTR,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: MyColors.tasarimAcikMavi,
              fontFamily: "SourceSansPro",
            ),
          ),
        ),
      ],
    );
  }

  relationships() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.drag_indicator,
        size: 35,
        color: MyColors.tasarimSiyah,
      ),
    );
  }

  buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          color: MyColors.emopasYesil,
          icon: Icon(
            Icons.save,
            size: 45,
          ),
        ),
        IconButton(
          onPressed: () {},
          color: Colors.redAccent,
          icon: Icon(
            Icons.delete_forever,
            size: 45,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.qr_code_scanner_rounded,
            size: 45,
          ),
        ),
      ],
    );
  }

  emektar() {
    return Container(
      child: Text(
        "Appointment",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21,
          color: MyColors.tasarimSiyah,
          fontFamily: "SourceSansPro",
        ),
      ),
    );
  }
}
