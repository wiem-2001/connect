import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

class AvatarController extends ChangeNotifier {
  void saveAvatar() {
    // Save avatar to storage or server
    // You can customize this method based on your requirements
    FluttermojiFunctions().encodeMySVGtoString().then((value) {
      // Save the avatar string
      print("Avatar saved: $value");
    });
  }
}
