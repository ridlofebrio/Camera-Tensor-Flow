import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends GetxController {
  late CameraController cameraController;
  late CameraDescription cameras;

  var isCameraInizialize = false.obs;
  @override
  void onInit() {
    super.onInit();
    initCamera();
  }
  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  // initCamera() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   final cameras = await availableCameras();
  //   cameraController = CameraController(cameras[0], ResolutionPreset.max);
  //   cameraController.initialize().then((value) {
  //     if (!cameraController.value.isInitialized) {
  //       return;
  //     }
  //     isCameraInizialize.value = true;
  //     update();
  //   });
  // }

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      final cameras = await availableCameras();
      cameraController = CameraController(cameras[0], ResolutionPreset.max);
      await cameraController.initialize();
      isCameraInizialize.value = true;
      update();
    } else {
      print('Perizinan Ditolak');
    }
  }
}
