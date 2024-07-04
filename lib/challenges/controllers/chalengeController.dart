import 'package:flutter/material.dart';
import 'package:my_first_app/challenges/models/challengeModel.dart';
import 'package:my_first_app/challenges/models/offerModel.dart';
import 'package:typicons_flutter/typicons_flutter.dart';


class ChallengesController extends ChangeNotifier {
  PageController pageController = PageController();
  int currentPage = 0;

final List<Challenge> challenges = [
  Challenge(
    'Unplug Devices',
    'Unplug all non-essential devices before leaving the office.',
    'Every day at 6 PM',
     0.30,
    10,
    true
  ),
    Challenge(
    'Turn Off Unnecessary Lights ',
    'Ensure all non-essential lights are turned off after work hours for a week.',
    'Every day at 6 PM',
    0.50,
    30,
    true
  ),
      Challenge(
    'Energy Efficient Equipment ',
    'Replace at least two old appliances with energy-efficient ones.',
    'Every day at 6 PM',
    0.0,
    200,
    false
  ),
];

static final List<Map<String, dynamic>> offers = [
    {
      'title': 'Earth Day Special',
      'description': 'Earn double points for all challenges completed during Earth Week.',
      'points': 'limited-time offer',
      'icon': Typicons.globe
    },
    {
      'title': 'New Year, New Savings Pack',
      'description': 'Start the new year with a bang! Use 500 points to get a pack of energy-saving devices and tips.',
      'points': '500pts',
      'icon': Typicons.calendar,
    },
      {
      'title': 'Summer Cooling Equipment Discount',
      'description': 'Beat the heat! Use 350 points to get a discount on energy-efficient cooling equipment.',
      'points': '350pts',
      'icon': Typicons.thermometer,
    },
    {
      'title': 'Anniversary Celebration',
      'description': 'Celebrate our anniversary with double points on all completed challenges.',
      'points': '350pts',
      'icon': Typicons.gift,
    },
  ];


  // Get active challenges
  List<Challenge> get activeChallenges {
    return challenges.where((challenge) => challenge.isActive).toList();
  }

  // Get new challenges
  List<Challenge> get newChallenges {
    return challenges.where((challenge) => !challenge.isActive).toList();
  }

  void changePage(int pageIndex) {
    currentPage = pageIndex;
    pageController.jumpToPage(pageIndex);
    notifyListeners();
  }
}
