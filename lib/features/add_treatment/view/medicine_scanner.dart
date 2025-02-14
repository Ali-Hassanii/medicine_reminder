import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

//! Just For Testing !//
//! Implement is not completed

//* I don't know how to recognize a medicine from the barcode
//* I'm looking for a database or an API that contains medicines info
// A medicine QR code has these information: GTIN, LOT, UID, EXP

// TODO: MedicineScaner :: Improve visual, onDetected and more ...

class MedicineScanner extends StatelessWidget {
  const MedicineScanner({super.key});

  static get route => MaterialPageRoute<void>(
        builder: (_) => MedicineScanner(),
      );

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      onDetect: (barcodes) {
        for (final barcode in barcodes.barcodes) {
          print('Barcode found! ${barcode.rawValue}');
        }
      },
    );
  }
}
