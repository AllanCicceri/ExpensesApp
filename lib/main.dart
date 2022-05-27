import 'package:expanses/components/transaction_user.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(ExpansesApp());

class ExpansesApp extends StatelessWidget {
  const ExpansesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ExpensesApp'),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Card(
              child: Text('Gráfico'),
            ),
            TransactionUser(),
          ]),
        ));
  }
}
