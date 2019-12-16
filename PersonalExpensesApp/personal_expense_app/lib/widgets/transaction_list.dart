import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //Use ListView.builder() when using large large lists
      //Doesnt load and render everything at once.
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            //Column and Row take multiple child widgets (unlimited)
            //Alignment but no styling options
            //Always takes full available height(column)/width(row)
            //Must use if widgets sit next to / above each other
            child: Row(
              children: <Widget>[
                //Containers take one child widget
                //Rich alignment and styling options
                //Flexible width, size it however you want
                //Perfect for custom syling and alignment
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    //Making it show dollar sign by string interpolation
                    //toStringAsFixed(2) makes sure there is two decimal no matter what
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  //Left to right alignment so
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactions[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    //Cleaning up the date using extra package
                    Text(
                      DateFormat.yMd().add_jm().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
