class Expensemodel {
  late int id;
  late String title;
  late double amount;
  DateTime dateTime;
  String type;
  Expensemodel({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.dateTime,
  });
}
