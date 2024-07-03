import 'package:flutter/material.dart';

class CircularImageContainer extends StatelessWidget {
  final String centralImagePath;

  CircularImageContainer({
    required this.centralImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, 
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white, 
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
         
          ClipRRect(
            borderRadius: BorderRadius.circular(50), 
            child: Image.asset(
              centralImagePath,
              width: 70, 
              fit: BoxFit.cover,
            ),
          ),
          // Shine Effect
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.transparent, Colors.white.withOpacity(0.3)],
                  stops: [0.0, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcOver,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
