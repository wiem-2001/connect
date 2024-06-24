import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:my_first_app/controllers/scan_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          if (!controller.isCameraInitialized.value) {
            print(controller.isCameraInitialized.value);
            print("and is false");
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print(controller.isCameraInitialized.value);
            print("and is true");
            return Stack(
              children: [
                Positioned.fill(
                  child: CameraPreview(controller.cameraController),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: (controller.y)*700,
                  right: (controller.x)*500,
                  child: Container(
                    width: controller.w*100*context.width/100,
                    height: controller.h*100*context.height/100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color.fromARGB(255, 110, 162, 153), width: 4.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Text(controller.label),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Add your take picture functionality here
                      },
                      backgroundColor: Color.fromARGB(255, 110, 162, 153),
                      child: Icon(Icons.camera_alt),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}