import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expensemodel.dart';

class ProviderClass extends ChangeNotifier {
  List<bool> isSelected = List.generate(2, (_) => false);
  late List<Expensemodel> dataList = [
    Expensemodel(
      id: 1,
      title: "Salary",
      amount: 1000.0,
      type: "Income",
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

  // function for toggle changes
  void toggle(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = false;
    }
    isSelected[index] = !isSelected[index];
    notifyListeners();
  }
}
