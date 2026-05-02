import 'package:expense_tracker/provider/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/screen/addExpense.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderClass providerClass = Provider.of<ProviderClass>(context);
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
          ).push(MaterialPageRoute(builder: (context) => AddExpense()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 100.0,
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: showData(providerClass),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                itemCount: providerClass.dataList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Text(providerClass.dataList[index].title),
                      trailing: Text(
                        "\$ ${providerClass.dataList[index].amount.toString()}",
                        style: TextStyle(
                          color: providerClass.dataList[index].type == 'Expense'
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showData(ProviderClass providerClass) {
    //Total Money
    //Income Expense

    return Column(
      children: [
        Text("Total Money:${providerClass.totalMoneyLeft}"),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Income:${providerClass.getIncomeAmount}",
              style: TextStyle(color: Colors.green),
            ),
            Text(
              "Expense:${providerClass.getExpenseAmount}",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
