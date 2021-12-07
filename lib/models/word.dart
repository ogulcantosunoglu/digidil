class Word {
  String word;
  String wordType;
  String turkishMeaning;
  String pronunciation;
  String definitionTR;
  String definitionEN;

  Word({
    this.word,
    this.wordType,
    this.turkishMeaning,
    this.pronunciation,
    this.definitionTR,
    this.definitionEN,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      wordType: json['wordType'],
      turkishMeaning: json['turkishMeaning'],
      pronunciation: json['pronunciation'],
      definitionTR: json['definitionTR'],
      definitionEN: json['definitionEN'],
    );
  }
}
