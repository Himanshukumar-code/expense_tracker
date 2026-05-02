import 'package:flutter/material.dart';
import 'package:expense_tracker/screen/addExpense.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 6.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => Addexpense()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        color: Colors.grey,
        height: 100.0,
        width: double.infinity,
        child: Card(
          child: Padding(padding: const EdgeInsets.all(8.0), child: showData()),
        ),
      ),
    );
  }

  Widget showData() {
    //Total Money
    //Income Expense

    return Column(
      children: [
        Text("Total Money:{total_money}"),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Income:{Income}", style: TextStyle(color: Colors.green)),
            Text("Expense:{Expense}", style: TextStyle(color: Colors.red)),
          ],
        ),
      ],
    );
  }
}
