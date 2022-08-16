import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(this._transactions,this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      child: _transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(_transactions[index].amount.toString()),
                          ),
                        ),
                      ),
                      title: Text(
                        _transactions[index].title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(
                          _transactions[index].date,
                        ),
                      ),
                      trailing: IconButton(
                        color: Theme.of(context).errorColor,
                        onPressed: ()=>_deleteTransaction(_transactions[index].id),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
