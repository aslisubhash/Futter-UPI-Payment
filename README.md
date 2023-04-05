Maintained by [Audio Kumbh](https://audiokumbh.com)

# UPI Payment Flutter Package

The `upi_payment_flutter` package is a Flutter plugin that simplifies the process of integrating UPI-based payment services into your app. It supports initiating transactions through UPI-enabled applications installed on the user's device.

## Features

- Initiate UPI transactions by generating and launching UPI URLs
- Handle errors when UPI payment is not supported on the user's device

## Installation

To use this package, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  upi_payment_flutter: ^0.0.1
```

Then, run `flutter pub get` to download and install the package.

## Usage

To use the `upi_payment_flutter` package, follow these steps:

1. Import the package:

```dart
import 'package:upi_payment_flutter/upi_payment_flutter.dart';
```

2. Create an instance of the `UpiPaymentHandler` class:

```dart
final upiPaymentHandler = UpiPaymentHandler();
```

3. Initiate a UPI transaction:

```dart
void _initiateTransaction() async {
  try {
    bool success = await upiPaymentHandler.initiateTransaction(
      payeeVpa: 'example@upi',
      payeeName: 'Example Merchant',
      transactionRefId: 'TXN123456',
      transactionNote: 'Test transaction',
      amount: 10.0,
    );

    if (success) {
      // Handle successful transaction initiation
    } else {
      // Handle unsuccessful transaction initiation
    }
  } on PlatformException catch (e) {
    // Handle errors when UPI is not supported on the user's device
  }
}
```

Replace the parameter values with the appropriate details for your transaction.

## Error Handling

The `initiateTransaction` method may throw a `PlatformException` if UPI payments are not supported on the user's device. You should catch this exception and handle it accordingly in your app.

```dart
try {
  // initiate transaction
} on PlatformException catch (e) {
  // handle error
}
```

## Support

For any questions, issues, or feature requests related to this package, please use the issue tracker on the package's repository.
