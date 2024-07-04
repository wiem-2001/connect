import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class OfferDetailScreen extends StatelessWidget {
  const OfferDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: AppBar(
              backgroundColor: Color.fromARGB(255, 39, 45, 105),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                'Offer Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: false,
              elevation: 0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Earth Day Special',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFfff4e6),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Points Required: 100pts',
                          style: TextStyle(
                            color: Color(0xFFEDB737),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare quam viverra orci sagittis eu. Elementum curabitur vitae nunc sed velit dignissim sodales ut. Urna nunc id cursus metus aliquam eleifend. A diam maecenas sed enim ut sem viverra aliquet eget. Sit amet risus nullam eget felis eget. Luctus venenatis lectus magna fringilla urna porttitor rhoncus. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Justo laoreet sit amet cursus sit. Sit amet cursus sit amet dictum sit amet justo. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Amet facilisis magna etiam tempor orci eu lobortis.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFfff4e6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Typicons.gift,
                          size: 100,
                          color: Color(0xFFEDB737),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement the logic to claim the offer here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 39, 45, 105),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                        child: Text(
                          'Claim Offer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
