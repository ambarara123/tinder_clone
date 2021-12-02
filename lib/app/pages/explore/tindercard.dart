import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/app/utils/CardProvider.dart';

class TinderCard extends StatefulWidget {
  final String imageUrl;
  final bool isFront;

  const TinderCard({Key? key, required this.imageUrl, required this.isFront})
      : super(key: key);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox.expand(
        child: widget.isFront ? getFirstCard() : getCard(),
      ),
    );
  }

  Widget getCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
            alignment: Alignment(-0.3, 0),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.black45,
                Colors.black
              ]
            )
          ),
        )
        ],
      ),
    );
  }

  Widget getFirstCard() => GestureDetector(
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
            transform: rotatedMatrix
              ..translate(cardPosition.dx, cardPosition.dy),
            child: Stack(
              children: [getCard(), getOverlayText()],
            ),
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

  Widget getOverlayText() {
    final provider = Provider.of<CardProvider>(context);
    final cardType = provider.getType();
    final cardOpacity = provider.getCardOpacity();

    switch (cardType) {
      case SwipeType.LIKE:
        final stamp = getTypeText(angle: -0.5, color: Colors.white70, text: "LIKE",opacity: cardOpacity);

        return Positioned(top: 70, left: 30,child: stamp);
      case SwipeType.DISLIKE:
        final stamp = getTypeText(angle: 0.5,color: Colors.red, text: "NOPE",opacity: cardOpacity);

        return Positioned(top: 70, right: 30,child: stamp);

      case SwipeType.SUPER_LIKE:
        final stamp = getTypeText(color: Colors.blue, text: "SUPER\nLIKE",opacity: cardOpacity);

        return Positioned(bottom: 120,left: 100,child: stamp);
      default: return Container();

    }
  }

  Widget getTypeText(
      {double angle = 0, required Color color, required String text,required double opacity}) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color, width: 4)),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: color, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
