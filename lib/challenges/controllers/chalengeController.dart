import 'package:flutter/material.dart';
import 'package:my_first_app/challenges/models/challengeModel.dart';
import 'package:my_first_app/challenges/models/offerModel.dart';
import 'package:typicons_flutter/typicons_flutter.dart';


class ChallengesController extends ChangeNotifier {
  PageController pageController = PageController();
  int currentPage = 0;

  final List<Challenge> challenges = [
    Challenge('Edit Proposal', 'Friday, 14th January 2022', 0.50),
    Challenge('Review Wireframes', 'Monday, 17th January 2022', 0.10),
    Challenge('Review Site', 'Wednesday, 19th January 2022', 0.20),
    Challenge('Presentation Prep', 'Thursday, 3rd February 2022', 0.30),
    Challenge('Blog Page', 'Monday, 7th February 2022', 0.40),
    Challenge('Complete Checkout Page', 'Monday, 7th February 2022', 0.70),
    Challenge('New Process Prototype', 'Tuesday, 15th March 2022', 0.80),
    Challenge('Design Mockups', 'Wednesday, 23rd March 2022', 0.90),
  ];

static final List<Map<String, dynamic>> offers = [
    {
      'title': 'Efficiency Upgrades',
      'description': 'Implement at least two energy-efficient',
      'points': '100pts',
      'icon': Typicons.gift,
      'iconColor': Color(0xFFEDB737),
    },
    {
      'title': 'Reduce Consumption',
      'description': 'Reduce energy consumption by 10%',
      'points': '200pts',
      'icon': Typicons.gift,
      'iconColor': Color(0xFF73EDB7),
    },
  ];


  void changePage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPage = pageIndex;
    notifyListeners();
  }
}
