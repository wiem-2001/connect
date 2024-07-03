import 'package:flutter/material.dart';
import 'package:my_first_app/challenges/controllers/chalengeController.dart';
import 'package:my_first_app/challenges/models/challengeModel.dart';
import 'package:my_first_app/challenges/views/challengesItem.dart';
import 'package:my_first_app/challenges/views/offerCardWidget.dart';
import 'package:provider/provider.dart';

class ChallengesWidget extends StatefulWidget {
  const ChallengesWidget({Key? key}) : super(key: key,);

  @override
  _ChallengesWidgetState createState() => _ChallengesWidgetState();
}
class _ChallengesWidgetState extends State<ChallengesWidget> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;
  int _currentPage = 0;
    late ChallengesController _controller; 
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = Provider.of<ChallengesController>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 45, 105),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'My Challenges',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Offers',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            EmptyZoneCard(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Challenges',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 39, 45, 105),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x32171717),
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 55, 124),
                      border: Border.all(
                        color: Color.fromARGB(255, 55, 65, 155), // Border color
                        width: 1, // Border width
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x32171717),
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildPageIndicator(0, 'Active challenges', Icons.energy_savings_leaf),
                          SizedBox(width: 8),
                          _buildPageIndicator(1, 'New challenges', Icons.tips_and_updates),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _buildChallengesPageView(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 39, 45, 105),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x32171717),
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
      ),
    );
  }
  Widget _buildPageIndicator(int pageIndex, String text, IconData icon) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: _currentPage == pageIndex
              ? Color.fromARGB(255, 48, 55, 124)
              : Color.fromARGB(255, 48, 55, 124),
          border: Border(
            bottom: BorderSide(
              color: _currentPage == pageIndex
                  ? Colors.transparent
                  : Color.fromARGB(255, 211, 151, 23),
              width: 2,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: _currentPage == pageIndex ? Colors.white : Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                color: _currentPage == pageIndex ? Colors.white : Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
 Widget _buildChallengesPageView() {
    return PageView(
      controller: _controller.pageController,
      onPageChanged: (int page) {
        setState(() {
          _controller.currentPage = page;
        });
      },
      children: [
        _buildChallengesPage('Daily Challenges', _controller.challenges),
        _buildChallengesPage('Weekly Challenges', _controller.challenges),
      ],
    );
  }
  Widget _buildChallengesPage(String title, List<Challenge> challenges) {
    return Container(
      color: Color.fromARGB(255, 39, 45, 105),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                return ChallengesItem(challenge: challenges[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
