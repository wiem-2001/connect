import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/challenges/controllers/chalengeController.dart';
import 'package:my_first_app/challenges/views/offerDetails.dart';

class OfferCardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildOfferCarousel(context);
  }

  Widget _buildOfferCarousel(BuildContext context) {
    final offers = ChallengesController.offers;
    return Container(
      padding: EdgeInsets.all(8),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 150,
          autoPlay: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(seconds: 3),
        ),
        items: offers.map((offer) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OfferDetailScreen(
                        offer: offer,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x32171717),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OfferDetailScreen(
                              offer: offer,
                            ),
                          ),
                        );
                      },
                      splashColor: Colors.grey.withOpacity(0.3), // Effet de couleur grise
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${offer['title']}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${offer['description']}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFfff4e6),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Text(
                                        'Points Required: ${offer['points']}',
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFfff4e6),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        offer['icon'],
                                        size: 70,
                                        color: Color(0xFFEDB737),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
