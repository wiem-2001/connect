import 'package:flutter/material.dart';
import 'package:my_first_app/userAvatar/controllers/profileController.dart';
import 'package:my_first_app/userAvatar/views/avatarView.dart';
import 'package:provider/provider.dart';
import 'package:fluttermoji/fluttermoji.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.6),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileController = Provider.of<Profile_Controller>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Account Settings',
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color.fromARGB(255, 165, 197, 240),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: FluttermojiCircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),  
                const SizedBox(height: 12),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      profileController.profile.userName,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      profileController.profile.userEmail,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ElevatedButton(
                       style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 165, 197, 240)), 
    ),
                      onPressed: () {
                        // Navigate to the avatar customization screen
                        Navigator.pushNamed(context, '/avatar');
                      },
                      child: Text('Update Avatar',style: TextStyle(color: Colors.black), 
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Divider(
                  thickness: 1,
                  indent: 24,
                  endIndent: 24,
                ),
                const SizedBox(height: 12),
                const SizedBox(height: 12),
                buildButtonWithAnimation('Edit Profile'),
                const SizedBox(height: 12),
                buildButtonWithAnimation('Account Settings'),
                const SizedBox(height: 16),
                buildButtonWithAnimation('Log Out'),
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget buildButtonWithAnimation(String text) {
  IconData iconData;
  switch (text) {
    case 'Edit Profile':
      iconData = Icons.person;
      break;
    case 'Account Settings':
      iconData = Icons.settings_rounded;
      break;
    case 'Log Out':
      iconData = Icons.logout_rounded;
      break;
    default:
      iconData = Icons.info;
      break;
  }

  return FadeTransition(
    opacity: _fadeAnimation,
    child: SlideTransition(
      position: _slideAnimation,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)), // Add bottom border
        ),
        child: InkWell(
          onTap: () {
            // Handle tap
            if (text == 'Log Out') {
              // Complete with logout
            } else {
              // Handle other menu items
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    size: 24,
                    color: Colors.black,
                  ),
                  SizedBox(width: 16), // Adjust spacing between icon and text
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


    }