import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/ui/scanner_paymet/components/custom_bottom.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:share_plus/share_plus.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  bool _flashOn = false;
  late MobileScannerController _scannerController;

  @override
  void initState() {
    super.initState();
    _scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      returnImage: true,
    );
  }

  void _toggleFlash() {
    setState(() {
      _flashOn = !_flashOn;
      _scannerController.toggleTorch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/generator");
            },
            icon: const Icon(Icons.qr_code),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Scan the QR Code to process your payment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 5),
                IconButton(
                  onPressed: _toggleFlash,
                  icon: Icon(
                    _flashOn ? Icons.flash_off_rounded : Icons.flash_on_rounded,
                  ),
                  color: Color(0xFF2B61E3),
                  iconSize: 40,
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 330,
                    width: 330,
                    child: MobileScanner(
                      controller: _scannerController,
                      onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        final Uint8List? image = capture.image;

                        if (image != null) {
                          showCustomBottomSheet(
                              context, barcodes.first.rawValue, image);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
