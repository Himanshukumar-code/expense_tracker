import 'package:flutter/material.dart';

class Addexpense extends StatefulWidget {
  const Addexpense({super.key});

  @override
  State<Addexpense> createState() => _AddexpenseState();
}

class _AddexpenseState extends State<Addexpense> {
  List<bool> isSelected = List.generate(2, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.wallet_rounded, color: Colors.white),
        title: Text("Add  your Expense", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: showForm(),
    );
  }

  Widget showForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: Text("Label"),
            hint: Text("Enter Title"),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text("Amount"),
            hint: Text("Enter Title"),
          ),
        ),
        ToggleButtons(
          selectedColor: Colors.green,
          isSelected: isSelected,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = false;
              }
              isSelected[index] = !isSelected[index];
            });
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
                Navigator.of(context).pop();
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
}
