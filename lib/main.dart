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
          Input(
            inputController: _accountInputController,
            label: 'Account Number',
            hint: '00000',
          ),
          Input(
            inputController: _valueInputController,
            label: 'Value',
            hint: '0.00',
            icon: Icons.monetization_on,
          ),
          ElevatedButton(
            child: Text("Confirmar"),
            onPressed: () => _createTranfer(),
          ),
        ],
      ),
    );
  }

  void _createTranfer() {
    final int? acountNumber = int.tryParse(_accountInputController.text);
    final double? value = double.tryParse(_valueInputController.text);
    if (acountNumber != null && value != null) {
      final transfer = Transfer(value, acountNumber);
    }
  }
}

class Input extends StatelessWidget {
  final TextEditingController? inputController;
  final String? label;
  final String? hint;
  final IconData? icon;

  Input({
    Key? key,
    this.inputController,
    this.label,
    this.hint,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: inputController,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
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
