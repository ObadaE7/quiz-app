class Question {
  int id;
  String text;
  List<String> options;
  int answer;
  int categoryId;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.answer,
    required this.categoryId,
  });
}
