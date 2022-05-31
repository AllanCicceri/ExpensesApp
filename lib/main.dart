import 'dart:ffi';
import 'dart:math';

import 'package:expanses/components/transaction_form.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'models/transaction.dart';

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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Tela de projeção',
        value: 110.50,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Camiseta branca botões',
        value: 109.75,
        date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          void myFunc(String, double) {} //REMOVER DEPOIS, SÓ PRA COMPILAR
          return TransactionForm(myFunc);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpensesApp'),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: () => _openTransactionFormModal(context),
              child: Icon(
                Icons.add,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Card(
            child: Text('Gráfico'),
          ),
          TransactionList(_transactions),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
