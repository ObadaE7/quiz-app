class Question {
  String text;
  List<String> options;
  int answer;
  int categoryId;

  Question({
    required this.text,
    required this.options,
    required this.answer,
    required this.categoryId,
  });
}
