import 'package:digidil/data/statics/my_colors.dart';
import 'package:digidil/services/word_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  int duration = 2;

  @override
  Widget build(BuildContext context) {
    WordService wordService = Provider.of<WordService>(context, listen: false);

    Future.delayed(
      Duration(seconds: this.duration),
      () async {
        wordService.getWordsCollectionFromFirebase().then(
              (value) => Navigator.pushNamedAndRemoveUntil(
                context,
                "/mainscreen",
                (route) => false,
              ),
            );
      },
    );

    return Material(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          color: MyColors.emopasYesil,
        ),
      ),
    );
  }
}
