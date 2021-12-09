import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> tinderPremiumList = [
  'Tinder Platinum',
  'Tinder Gold',
  'Invite Friends',
  'Tinder Plus',
  'Increase your chances'
];

/// Todo Change the String type to our own data class type which contains
/// data class TinderPremium(
/// val imageIcon : Drawable,
/// val mainTextHeading : String,
/// val subTextSubHeading : String
/// )

class GetTinderPremiumCarousel extends StatefulWidget {
  const GetTinderPremiumCarousel({Key? key}) : super(key: key);

  @override
  _GetTinderPremiumCarouselState createState() =>
      _GetTinderPremiumCarouselState();
}

class _GetTinderPremiumCarouselState extends State<GetTinderPremiumCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: tinderPremiumList
              .map(
                (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Center(
                        child: Text(
                          '${tinderPremiumList[_currentIndex]}',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.black45,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tinderPremiumList.map((urlOfItem) {
            int index = tinderPremiumList.indexOf(urlOfItem);
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color.fromRGBO(0, 0, 0, 0.8)
                    : Color.fromRGBO(0, 0, 0, 0.3),
              ),
            );
          }).toList(),
        ),
        // Adding a button for the carousel here
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Text("Get Premium from here"),
        )
      ],
    );
  }
}
