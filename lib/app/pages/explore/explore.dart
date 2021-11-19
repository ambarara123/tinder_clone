import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getBottomSheet(),
    );
  }

  Widget getBottomSheet() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            return Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10)
                  ]),
              child: Center(
                child: Icon(
                  Icons.refresh,
                  color: Colors.yellow,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Container(
        height: size.height,
        child: TinderSwapCard(
          maxHeight: size.height*0.75,
          maxWidth: size.width,
          minHeight: size.height * 0.6,
          minWidth: size.width * 0.75,
          totalNum: 10,
          cardBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
