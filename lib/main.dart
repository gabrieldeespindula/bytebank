// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateTransferPage(),
    );
  }
}

// Form

class CreateTransferPage extends StatelessWidget {
  CreateTransferPage({Key? key}) : super(key: key);

  final TextEditingController _valueInputController = TextEditingController();
  final TextEditingController _accountInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Transfer'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _accountInputController,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: "Account Number",
                hintText: '00000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _valueInputController,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: "Value",
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            child: Text("Confirmar"),
            onPressed: () {
              final int? acountNumber =
                  int.tryParse(_accountInputController.text);
              final double? value = double.tryParse(_valueInputController.text);
              if (acountNumber != null && value != null) {
                final transfer = Transfer(value, acountNumber);
              }
            },
          ),
        ],
      ),
    );
  }
}

// Transfer
class TransferPage extends StatelessWidget {
  TransferPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: Column(
        children: <Widget>[TransferCard(Transfer(23.69, 674875))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferCard extends StatelessWidget {
  final Transfer _transfer;

  TransferCard(this._transfer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(_transfer.value.toString()),
              subtitle: Text(_transfer.account.toString())),
        ],
      ),
    );
  }
}

class Transfer {
  final double value;
  final int account;

  Transfer(this.value, this.account);
}
