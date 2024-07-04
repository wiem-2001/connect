import 'package:flutter/material.dart';
import 'package:my_first_app/Utils/ImageUtils%20.dart';
import 'dart:math'; // Import for Random class
import 'package:my_first_app/challenges/models/challengeModel.dart';
import 'package:my_first_app/challenges/views/CircularImageContainer%20.dart';


class ChallengesItem extends StatelessWidget {
  final Challenge challenge;
  const ChallengesItem({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final randomImagePath = ImageUtils.getRandomImagePath();
    return Container(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 48, 55, 124),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CircularImageContainer(
                  centralImagePath: randomImagePath,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          challenge.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 151, 23),
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                        ),
                        Text(
                          'Points: ${challenge.points} pts',
                          style: const TextStyle(
                            fontSize: 8.5,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 151, 23),
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      challenge.description,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                      overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.white,
                            valueColor: const AlwaysStoppedAnimation(
                              Color(0xFFF4266F6),
                            ),
                            value: challenge.percentageComplete,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${(challenge.percentageComplete * 100).round()}%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                          
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
