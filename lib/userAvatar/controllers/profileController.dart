// profile_controller.dart

import 'package:flutter/foundation.dart';
import 'package:my_first_app/userAvatar/models/userModel.dart';

class Profile_Controller extends ChangeNotifier {
  // Example profile data
  Usermodel _profile = Usermodel(
    userName: 'User user',
    userEmail: 'User.user@example.com',
    avatarUrl: "url"
  );

  Usermodel get profile => _profile;

  // Add methods to update profile data if needed
}
