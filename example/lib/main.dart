import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upi_payment_flutter/upi_payment_flutter.dart';

void main() {
  runApp(UpiPaymentExampleApp());
}

class UpiPaymentExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPI Payment Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpiPaymentExampleHomePage(),
    );
  }
}

class UpiPaymentExampleHomePage extends StatefulWidget {
  @override
  _UpiPaymentExampleHomePageState createState() =>
      _UpiPaymentExampleHomePageState();
}

class _UpiPaymentExampleHomePageState extends State<UpiPaymentExampleHomePage> {
  final upiPaymentHandler = UpiPaymentHandler();

  Future<void> _initiateTransaction() async {
    try {
      bool success = await upiPaymentHandler.initiateTransaction(
        payeeVpa: '9123187812@upi',
        payeeName: 'Example Merchant',
        transactionRefId: 'TXN123456',
        transactionNote: 'Test transaction',
        amount: 10.0,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Transaction initiated successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Transaction initiation failed.')),
        );
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Payment Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the button below to initiate a UPI transaction:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _initiateTransaction,
        tooltip: 'Initiate Transaction',
        child: Icon(Icons.payment),
      ),
    );
  }
}
