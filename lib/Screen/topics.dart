import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Topics extends StatelessWidget {
  const Topics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo.shade200,
        title: Text(
          Get.arguments[0],
          style: const TextStyle(fontSize: 18, letterSpacing: 2),
        ),
      ),
      body: SfPdfViewer.network(
        Get.arguments[1],
      ),
    );
  }
}
