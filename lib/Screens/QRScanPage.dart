
import 'package:flutter/material.dart';


class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('QR Code Scanner'),
      ),
   
    );
  }
}
