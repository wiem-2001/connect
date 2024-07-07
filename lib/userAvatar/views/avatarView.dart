import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:my_first_app/userAvatar/controllers/avatarController.dart';
import 'package:provider/provider.dart';

class AvatarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final avatarController = Provider.of<AvatarController>(context);

    return Scaffold(
      backgroundColor: Colors.white, // Set the background color of the Scaffold
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Personalize Your Avatar',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Show confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Save Avatar Changes?'),
                    content: Text('Are you sure you want to save changes to your avatar?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: Text('Save'),
                        onPressed: () {
                          avatarController.saveAvatar(); // Perform save action
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Avatar section at the top
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16.0),
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
          
          // Spacer to push items to the bottom
          Spacer(),
          // Customization options at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FluttermojiCustomizer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}