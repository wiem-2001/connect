import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ScanController extends GetxController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  var isCameraInitialized = false.obs;
  var x = 0.0, y = 0.0, w = 0.0, h = 0.0;
  var label = "";
  var cameraCount =0 ;
  int inferenceInterval = 500; // in milliseconds
  DateTime lastInferenceTime = DateTime.now();
  bool isProcessing = false;
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
            cameraCount++ ;
            if(cameraCount % 10 == 0 ){
              cameraCount=0 ;
              objectDetector(image);
            }

          });
      
        });
            isCameraInitialized(true) ;
            update();
            
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
      model: "assets/converted_model.tflite",
      labels: "assets/labels_converted_model.txt",
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
   print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$res");
}


  // void objectDetector(CameraImage image) async {
    
  //     var recognitions = await Tflite.runModelOnFrame(
  //       bytesList: image.planes.map((plane) {
  //         return plane.bytes;
  //       }).toList(),
  //       asynch: true,
  //       imageHeight: image.height,
  //       imageWidth: image.width,
  //       imageMean: 127.5,
  //       imageStd: 127.5,
  //       rotation: 90, // Adjust according to your camera orientation
  //       numResults: 1, // Number of object detection results to return
  //       threshold: 0.4, // Confidence threshold for detected objects
  //     );

  //     if (recognitions != null && recognitions.isNotEmpty) {
  //       print("Result is $recognitions") ; 
  //       // var ourDetectorObject = recognitions.first;
  //       // if (ourDetectorObject['confidenceInClass'] * 100 > 45) {
  //       //   label = ourDetectorObject['detectedClass'].toString();
  //       //   h = ourDetectorObject['rect']['h'].toDouble();
  //       //   w = ourDetectorObject['rect']['w'].toDouble();
  //       //   x = ourDetectorObject['rect']['x'].toDouble();
  //       //   y = ourDetectorObject['rect']['y'].toDouble();
  //         // update();
  //       // }
  //     }
  // }

  void objectDetector(CameraImage image) async {
  try {
     if (isProcessing) return;
    isProcessing = true;
   var recognitions = await Tflite.runModelOnFrame(
  bytesList: image.planes.map((plane) {return plane.bytes;}).toList(),// required
  imageHeight: image.height,
  imageWidth: image.width,
  imageMean: 127.5,   // defaults to 127.5
  imageStd: 127.5,    // defaults to 127.5
  rotation: 90,       // defaults to 90, Android only
  numResults: 2,      // defaults to 5
  threshold: 0.1,     // defaults to 0.1
  asynch: true        // defaults to true
);
    // if (recognitions != null && recognitions.isNotEmpty) {
    //     var ourDetectorObject = recognitions.first;
    //     if (ourDetectorObject['confidenceInClass'] * 100 > 45) {
    //       label = ourDetectorObject['detectedClass'].toString();
    //       h = ourDetectorObject['rect']['h'].toDouble();
    //       w = ourDetectorObject['rect']['w'].toDouble();
    //       x = ourDetectorObject['rect']['x'].toDouble();
    //       y = ourDetectorObject['rect']['y'].toDouble();
    //       update();
    //     }
    //   }
    if (recognitions != null && recognitions.isNotEmpty) {
      print("Result is $recognitions");
    } else {
      print("No recognitions detected");
    }
  } catch (e) {
    print('Error running model on frame: $e');
  }
  finally {
      isProcessing = false;
    }
}

}
