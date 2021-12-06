import 'package:digidil/data/statics/my_appbars.dart';
import 'package:digidil/data/statics/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBars.getDefault(context),
      backgroundColor: Colors.white,
      body: mainWidget(),
      bottomSheet: BottomSheet(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "© Digidil Project 2021 All rights reserved.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: MyColors.tasarimSiyah,
                fontFamily: "SourceSansPro",
              ),
            ),
          );
        },
        onClosing: () {},
      ),
    );
  }

  mainWidget() {
    return StaggeredGridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      padding: EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 0.0,
      ),
      children: <Widget>[
        Card(
          elevation: 5,
          margin: EdgeInsets.all(20),
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
              StaggeredTile.extent(3, 135),
              StaggeredTile.extent(3, 55),
            ],
          ),
        ),
        buttons(),
      ],
      staggeredTiles: [
        StaggeredTile.extent(3, 445),
        StaggeredTile.extent(3, 75),
      ],
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
            left: 25,
          ),
          child: Text(
            "Appointment",
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
            left: 25,
          ),
          child: Text(
            "uh * poynt * muhnt",
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
        left: 25,
      ),
      child: Text(
        "Noun | İsim",
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
            left: 25,
          ),
          child: Text(
            "Meaning, engagement, date, tryst",
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
            left: 25,
          ),
          child: Text(
            "Randevu, Atama, Tayin, Görev",
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
            left: 25,
          ),
          child: Text(
            "an arrangement to meet someone at a particular time and place.",
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
            left: 25,
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
            left: 25,
          ),
          child: Text(
            "bir kimseden, belli bir yerde ve belli bir saatte buluşmak için söz almak.",
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
        size: 55,
        color: MyColors.tasarimSiyah,
      ),
    );
  }

  buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          color: MyColors.emopasYesil,
          icon: Icon(
            Icons.save,
            size: 55,
          ),
        ),
        SizedBox(
          width: 35,
        ),
        IconButton(
          onPressed: () {},
          color: Colors.redAccent,
          icon: Icon(
            Icons.delete_forever,
            size: 55,
          ),
        ),
        SizedBox(
          width: 35,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.qr_code_scanner_rounded,
            size: 55,
          ),
        ),
        SizedBox(
          width: 26,
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
