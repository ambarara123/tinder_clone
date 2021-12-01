import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/app/utils/CardProvider.dart';

class TinderCard extends StatefulWidget {
  final String imageUrl;

  const TinderCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {

  @override
  void initState() {
    super.initState();


    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;
      final provider = Provider.of<CardProvider>(context,listen: false);
      provider.setScreenSize(size);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox.expand(
        child: getCard(),
      ),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://image.shutterstock.com/image-photo/autumn-park-yellow-trees-road-260nw-1527128807.jpg"),
          alignment: Alignment(-0.3, 0),
          fit: BoxFit.cover,
        )),
      ),
    );
  }

  Widget getCard() => GestureDetector(
        child: LayoutBuilder(builder: (context, constraints) {
          //we can initialize provider directly
          final provider = Provider.of<CardProvider>(context);
          final cardPosition = provider.position;
          final animationDuration = provider.isDragging ? 0 : 400;

          final center = constraints.smallest.center(Offset.zero);
          final angle = provider.angle * pi / 180;

          final rotatedMatrix = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);

          return AnimatedContainer(
            duration: Duration(
              milliseconds: animationDuration,
            ),
            transform: rotatedMatrix..translate(cardPosition.dx,cardPosition.dy),
            child: getBody(),
            curve: Curves.easeInOut,
          );
        }),
        onPanStart: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.start(details);
        },
        onPanUpdate: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.update(details);
        },
        onPanEnd: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.end();
        },
      );
}
