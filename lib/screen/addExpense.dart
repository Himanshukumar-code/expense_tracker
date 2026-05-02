import 'package:expense_tracker/Model/expensemodel.dart';
import 'package:expense_tracker/provider/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpense extends StatelessWidget {
  AddExpense({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  List<bool> isSelected = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ProviderClass providerClass, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.wallet_rounded, color: Colors.white),
            title: Text(
              "Add  your Expense",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
          body: showForm(providerClass, context),
        );
      },
    );
  }

  Widget showForm(ProviderClass providerClass, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(
            label: Text("Label"),
            hint: Text("Enter Title"),
          ),
        ),
        TextFormField(
          controller: amountController,
          decoration: InputDecoration(
            label: Text("Amount"),
            hint: Text("Enter Title"),
          ),
        ),
        ToggleButtons(
          selectedColor: Colors.green,
          isSelected: isSelected,
          onPressed: (int index) {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = false;
            }
            isSelected[index] = !isSelected[index];
          },
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.wallet_outlined),
                  SizedBox(width: 10.0),
                  Text("Expense"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.wallet_outlined),
                  SizedBox(width: 10.0),
                  Text("Income"),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                saveData(providerClass, context);
              },
              child: Text("Submit"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        ),
      ],
    );
  }

  void saveData(ProviderClass providerClass, BuildContext context) {
    if (titleController!.text.isEmpty || amountController!.text.isEmpty) {
      print("Fields cannot be empty");
      return;
    }

    double? amount = double.tryParse(amountController!.text);
    if (amount == null) {
      print("Invalid amount");
      return;
    }

    print(
      "save data ${providerClass.dataList.length}${isSelected[0] ? "Expense" : "Income"}",
    );
    providerClass.addToList(
      Expensemodel(
        id: providerClass.dataList.length,
        title: titleController!.text,
        amount: double.parse(amountController!.text),
        type: isSelected[0] ? "Expense" : "Income",
        dateTime: DateTime.now(),
      ),
    );
    Navigator.of(context).pop();
  }
}
