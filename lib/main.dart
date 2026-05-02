import 'package:flutter/material.dart';
import 'package:expense_tracker/screen/home.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/provider/providerclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderClass(),
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
