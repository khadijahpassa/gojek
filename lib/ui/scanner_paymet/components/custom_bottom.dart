import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:gojek/consts.dart';

void showCustomBottomSheet(
    BuildContext context, String? barcodeData, Uint8List image) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.4,
        maxChildSize: 0.6,
        minChildSize: 0.4,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: barcodeData == null ? 0.0 : 1.0,
                  duration: const Duration(seconds: 1),
                  child: Text(barcodeData ?? "No reference found from this QR",
                      style: bold18),
                ),
                const SizedBox(height: 16),
                AnimatedScale(
                  scale: barcodeData == null ? 0.0 : 1.0,
                  duration: const Duration(seconds: 1),
                  child: Center(
                    child: Image.memory(
                      image,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    if (barcodeData != null) {
                      Share.share(barcodeData);
                    }
                  },
                  icon: const Icon(Icons.share),
                  label: const Text("Share QR Code"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
