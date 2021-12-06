import 'package:flutter/material.dart';

import 'my_colors.dart';

/// Uygulamamızda kullanacağımız Appbar'ları bu static sınıfta tanımlıyoruz.
class MyAppBars {
  static AppBar getDefault(
    BuildContext context,
  ) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.0,
      centerTitle: true,
      title: Column(
        children: <Widget>[
          Text(
            "Digidil Projesi",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "SourceSansPro",
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5.0),
            height: 5.0,
            width: MediaQuery.of(context).size.width * 1 / 2 + 50,
            color: Color.fromRGBO(92, 205, 103, 1.0),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
