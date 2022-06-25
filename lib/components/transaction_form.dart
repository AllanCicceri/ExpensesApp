import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _submitForm() {
      final title = titleController.text;
      final value = double.tryParse(valueController.text) ?? 0.0;

      if (title.isEmpty || value <= 0) {
        return;
      }

      widget.onSubmit(title, value);
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Value (R\$)'),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Text('No date'),
                  SizedBox(
                    width: 100,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Select date'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Nova Transação'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
