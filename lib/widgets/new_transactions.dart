import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredamount <= 0) {
      return; //By just retuning nothing it will not render the next part of the func
    }

    widget.addTx(
      //widget is so i can access addtx from state class even thought it is created in the other one
      enteredTitle,
      enteredamount,
    );
    Navigator.of(context).pop(); //closes menu when i enter vaults
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) {
              //titleInput = val;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  submitData(), //underscore is telling that it will get argument but wont use it
              //onChanged: (val) {
              //amountInput = val;
              //},
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add transaction'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
