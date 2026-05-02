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
        centerTitle: true,
        title: Text("Expense Tracker", style: TextStyle(color: Colors.black)),
        elevation: 6.0,
        backgroundColor: Colors.white,
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
            height: 100.0,
            width: double.infinity,
            child: Card(
              color: Colors.grey[200],
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
                      title: Text(
                        providerClass.dataList[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        providerClass.dataList[index].dateTime.toString(),
                      ),
                      trailing: Text(
                        "\$${providerClass.dataList[index].amount.toString()}",
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
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
        Text(
          "Monthly Summary",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Total Income:\$${providerClass.getIncomeAmount}"),
            Text("Total Expense:\$${providerClass.getExpenseAmount}"),
          ],
        ),
        Text(
          "Remaining Balance:\$${providerClass.totalMoneyLeft}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
