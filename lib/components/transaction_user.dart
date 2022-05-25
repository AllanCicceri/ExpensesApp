import 'package:expanses/components/transaction_form.dart';
import 'package:expanses/components/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  @override
  Widget build(BuildContext context) {
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

    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}
