import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:my_first_app/Ai/views/CameraView.dart';
import 'package:my_first_app/Ai/views/siteObjects.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:flutter/material.dart';

class ScanController extends GetxController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  var isCameraInitialized = false.obs;
  var x = 0.0, y = 0.0, w = 0.0, h = 0.0;
  var label = "";
  var cameraCount = 0;
  int inferenceInterval = 500; // in milliseconds
  DateTime lastInferenceTime = DateTime.now();
  bool isProcessing = false;
  var detectedObjects = <Map<String, dynamic>>[].obs; // List to store detected objects

  @override
  void onInit() {
    super.onInit();
    initCamera();
    initTFLite();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
    Tflite.close();
  }

  Future<void> initCamera() async {
    if (await Permission.camera.request().isGranted &&
        await Permission.microphone.request().isGranted) {
      try {
        cameras = await availableCameras();
        cameraController = CameraController(
          cameras[0],
          ResolutionPreset.medium,
        );

        await cameraController.initialize().then((_) {
          cameraController.startImageStream((image) {
            cameraCount++;
            if (cameraCount % 10 == 0) {
              cameraCount = 0;
              objectDetector(image);
            }
          });
          isCameraInitialized(true);
          update();
        });
      } catch (e) {
        print('Failed to initialize camera: $e');
        isCameraInitialized.value = false;
      }
    } else {
      print("Camera or microphone permission denied");
    }
  }

  Future<void> initTFLite() async {
    String? res = await Tflite.loadModel(
      model: "assets/sfmModel.tflite",
      labels: "assets/sfmModelLabels.txt",
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
    print("Model loaded: $res");
  }

  void objectDetector(CameraImage image) async {
    if (isProcessing) return;
    isProcessing = true;
    try {
      var recognitions = await Tflite.runModelOnFrame(
        bytesList: image.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );

      if (recognitions != null && recognitions.isNotEmpty) {
        var ourDetectorObject = recognitions.first;
        if (ourDetectorObject != null && ourDetectorObject['confidenceInClass'] != null && ourDetectorObject['confidenceInClass'] * 100 > 20) {
          label = ourDetectorObject['detectedClass'].toString();
          h = ourDetectorObject['rect']['h'].toDouble();
          w = ourDetectorObject['rect']['w'].toDouble();
          x = ourDetectorObject['rect']['x'].toDouble();
          y = ourDetectorObject['rect']['y'].toDouble();
          
          // Save detected object
          detectedObjects.add({
            'label': label,
            'x': x,
            'y': y,
            'w': w,
            'h': h,
          });
          update();
        }
      }

      if (recognitions != null && recognitions.isNotEmpty) {
        print("Result is $recognitions");
      } else {
        print("No recognitions detected");
      }
    } catch (e) {
      print('Error running model on frame: $e');
    } finally {
      isProcessing = false;
    }
  }

  void navigateToSitedObjects() {
    Get.to(SiteObjects(), arguments: detectedObjects);
  }
}
