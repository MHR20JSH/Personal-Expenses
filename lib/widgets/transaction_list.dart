import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, Constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transaction Added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 93,
                  height: Constraints.maxHeight * 0.8,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: FittedBox(
                          child: Text('${transaction[index].amount} \$')),
                    ),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMEd().format(transaction[index].date)),
                  trailing: MediaQuery.of(context).size.width > 360
                      ? FlatButton.icon(
                          onPressed: () => deleteTx(transaction[index].id),
                          icon: Icon(Icons.delete),
                          textColor: Theme.of(context).errorColor,
                          label: Text("delete"))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transaction[index].id),
                        ),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }
}
