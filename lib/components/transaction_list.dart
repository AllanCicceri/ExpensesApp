import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 10),
                  child: Text(
                    "No transactions",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Container(
                  height: constraints.minHeight * 0.6,
                  child: Image.asset(
                    'assets/imgs/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          }))
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];

              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text('R\$${tr.value.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                  trailing: IconButton(
                      onPressed: () => onRemove(tr.id),
                      icon: Icon(
                        Icons.delete,
                      )),
                ),
              );
            },
          );
  }
}


// Card(
//                     elevation: 3,
//                     child: Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 10),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Colors.purple.shade200, width: 2)),
//                           padding: EdgeInsets.all(10),
//                           child: Text(
//                             'R\$ ${e.value.toStringAsFixed(2)}',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.purple.shade200,
//                             ),
//                           ),
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               e.title,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Text(
//                               DateFormat('d MMM y').format(e.date),
//                               style: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );