import 'dart:async';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


class UpiPaymentHandler {
  static const _upiUrlScheme = 'upi://pay';

  Future<bool> initiateTransaction({
    required String payeeVpa,
    required String payeeName,
    required String transactionRefId,
    required String transactionNote,
    required double amount,
  }) async {
    String url = _createUpiUrl(
      payeeVpa: payeeVpa,
      payeeName: payeeName,
      transactionRefId: transactionRefId,
      transactionNote: transactionNote,
      amount: amount,
    );

if (await canLaunchUrl(Uri.parse(url))) {
  await launchUrl(Uri.parse(url));
      return true;
    } else {
      throw PlatformException(
          code: 'UPI_NOT_SUPPORTED',
          message: 'UPI payment is not supported on this device.');
    }
  }

  String _createUpiUrl({
    required String payeeVpa,
    required String payeeName,
    required String transactionRefId,
    required String transactionNote,
    required double amount,
  }) {
    return Uri(
      scheme: _upiUrlScheme,
      queryParameters: {
        'pa': payeeVpa,
        'pn': payeeName,
        'tid': transactionRefId,
        'tn': transactionNote,
        'am': amount.toStringAsFixed(2),
        'cu': 'INR',
      },
    ).toString();
  }
}

