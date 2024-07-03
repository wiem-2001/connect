import 'dart:math';

class ImageUtils {
  static String getRandomImagePath() {
    final List<String> imagePaths = [
      'assets/images/troph.png',
      'assets/images/medal.png',
      'assets/images/medaal.png',
      'assets/images/star.png',
      'assets/images/trophy.png',
    ];

    final random = Random();
    return imagePaths[random.nextInt(imagePaths.length)];
  }
}
