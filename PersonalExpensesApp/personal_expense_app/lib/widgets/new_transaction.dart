import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  //Binding that function to this function
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    //Wont submit data if either of the form inputs is empty
    if (enteredAmount <= 0 || enteredTitle.isEmpty){
      return;
    }
    widget.addTransaction(
      enteredTitle,
      enteredAmount,
    );

    //Here were are popping/closing the top most sheet which 
    //Happens to be the form within this situation
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              //Or it can be done this way
              //onChanged: (val) => amountInput = val,
              //Another way
              controller: amountController,
              //Number keypad because it is for price
              keyboardType: TextInputType.number,
              //Submitting the form when "check" is pressed
              //Using an anonymous function with "_" empty parameter
              //Using empty parameter when it wont be used
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Theme.of(context).primaryColor,
              //Data isnt being dumped so you dont need the anonymous function
              //only passing reference here beacause not anonymous
              onPressed: submitData,        
            ),
          ],
        ),
      ),
    );
  }
}
