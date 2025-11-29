class Answer {
  final String answerChoice;

  Answer({
    required this.answerChoice,
  });


  bool isGood( String goodChoice ) => answerChoice == goodChoice;

}
