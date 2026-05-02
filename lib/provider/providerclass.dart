import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expensemodel.dart';

class ProviderClass extends ChangeNotifier {
  late List<Expensemodel> dataList = [
    Expensemodel(
      id: 1,
      title: "Education",
      amount: 1000.0,
      type: "Income",
      dateTime: DateTime.now(),
    ),
    Expensemodel(
      id: 2,
      title: "Education",
      amount: 100.0,
      type: "Expense",
      dateTime: DateTime.now(),
    ),
  ];
  List<Expensemodel> get getAllData => dataList;
  double get getExpenseAmount =>
      dataList.where((data) => data.type == 'Expense').fold(0, (sum, data) {
        return sum + data.amount;
      });
  double get getIncomeAmount => dataList
      .where((element) => element.type == 'Income')
      .fold(0, (sum, data) {
        return sum + data.amount;
      });
  double get totalMoneyLeft => getIncomeAmount - getExpenseAmount;
  void addToList(Expensemodel expenseModel) {
    dataList.add(expenseModel);
    notifyListeners();
  }
}
