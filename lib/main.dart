import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreateTransferPage(),
    );
  }
}

// Form

class CreateTransferPage extends StatelessWidget {
  const CreateTransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Transfer'),
      ),
      body: null,
    );
  }
}

// Transfer
class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: Column(
        children: const <Widget>[TransferCard(Transfer(23.69, 674875))],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferCard extends StatelessWidget {
  final Transfer _transfer;

  const TransferCard(this._transfer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.monetization_on),
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

  const Transfer(this.value, this.account);
}
