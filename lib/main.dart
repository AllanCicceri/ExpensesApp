import 'package:expanses/models/transaction.dart';
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

  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Tela de projeção',
        value: 110.50,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Camiseta branca botões',
        value: 90.75,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ExpensesApp'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Text('Gráfico'),
              ),
              Column(
                children: [
                  ..._transactions.map((e) => Card(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.purple, width: 2)),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                e.value.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(e.title),
                                Text(e.date.toLocal().toString()),
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ]));
  }
}
