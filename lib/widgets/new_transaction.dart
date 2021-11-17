import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountControler.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleControler.text;
    final enteredAmount = double.parse(_amountControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) return;
      setState(() {
        _selectedDate = pickDate;
      });
    });
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        // margin: EdgeInsets.all(150),
        child: Container(
          //height: 260,
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                cursorColor: Colors.purple,
                cursorHeight: 30,
                cursorWidth: 2,
                decoration: InputDecoration(labelText: 'Title'),
                keyboardType: TextInputType.name,
                controller: _titleControler,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                cursorColor: Colors.purple,
                cursorHeight: 30,
                cursorWidth: 2,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                controller: _amountControler,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chossen!'
                            : 'Picyked Date is :  ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                      child: Text('Chose Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: _submitData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.button.color,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
