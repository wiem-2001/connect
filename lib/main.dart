import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/Ai/views/CameraView.dart';
import 'package:my_first_app/Ai/views/siteObjects.dart';
import 'package:my_first_app/Ai/views/siteZones.dart';
import 'package:my_first_app/userAvatar/views/avatarView.dart';
import 'package:my_first_app/userAvatar/views/userSettings.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/userAvatar/controllers/avatarController.dart';
import 'package:my_first_app/userAvatar/controllers/profileController.dart'; // Add this import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AvatarController(),
      child: ChangeNotifierProvider(
        create: (context) => Profile_Controller(), // Add Profile_Controller provider
        child: GetMaterialApp(
          title: 'SFM CONNECT',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ProfileSettings(), // or any other initial screen
          getPages: [
            GetPage(name: '/cameraView', page: () => CameraView()),
            GetPage(name: '/siteZones', page: () => SiteZones()),
            GetPage(name: '/detectedObjects', page: () => SiteObjects()),
            GetPage(name: '/avatar', page: () => AvatarView()),
          ],
        ),
      ),
    );
  }
}
