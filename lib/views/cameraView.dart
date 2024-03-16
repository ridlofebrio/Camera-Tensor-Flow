import 'package:camera/camera.dart';
import 'package:cameratensorflow/controller/scanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            return controller.isCameraInizialize.value
              ? CameraPreview(controller.cameraController)
              : Center(child: const Text('Loading Camera'));
          }),
    );
  }
}
