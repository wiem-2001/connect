import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/challenges/controllers/chalengeController.dart';
import 'package:my_first_app/challenges/views/offerDetails.dart';
import 'package:provider/provider.dart';

import 'package:my_first_app/Ai/views/CameraView.dart';
import 'package:my_first_app/Ai/views/siteObjects.dart';
import 'package:my_first_app/Ai/views/siteZones.dart';
import 'package:my_first_app/challenges/models/challengeModel.dart' as model;
import 'package:my_first_app/challenges/views/challengesItem.dart';
import 'package:my_first_app/challenges/views/challengesOffersView.dart';
import 'package:my_first_app/userAvatar/views/avatarView.dart';
import 'package:my_first_app/userAvatar/views/userSettings.dart';
import 'package:my_first_app/userAvatar/controllers/avatarController.dart';
import 'package:my_first_app/userAvatar/controllers/profileController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AvatarController()),
        ChangeNotifierProvider(create: (context) => Profile_Controller()),
        
      ],
      child: GetMaterialApp(
        title: 'SFM CONNECT',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      //  home : ProfileSettings(),
        home: ChangeNotifierProvider(
  create: (context) => ChallengesController(),
  child: ChallengesOffersView(),
),
        getPages: [
          GetPage(name: '/cameraView', page: () => CameraView()),
          GetPage(name: '/siteZones', page: () => SiteZones()),
          GetPage(name: '/detectedObjects', page: () => SiteObjects()),
          GetPage(name: '/avatar', page: () => AvatarView()),
        ],
      ),
    );
  }
}
