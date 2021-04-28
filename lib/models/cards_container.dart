import 'package:card_animation/models/card_model.dart';
import 'package:card_animation/models/components/card_clipper.dart';
import 'package:card_animation/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardsContainer extends StatefulWidget {
  final Animation containerHeightAnimation;
  final Animation cardXAnimation;
  final Animation<double> cardSize;
  final Animation cardTransform;
  final AnimationController animationController;

  CardsContainer({
    Key? key,
    required this.containerHeightAnimation,
    required this.animationController,
    required this.cardXAnimation,
    required this.cardSize,
    required this.cardTransform,
  }) : super(key: key);

  @override
  _CardsContainerState createState() => _CardsContainerState();
}

class _CardsContainerState extends State<CardsContainer> {
  double x = 0.50;
  double y = 0.01;
  double height = 200;
  bool cardsOpen = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: widget.containerHeightAnimation,
      builder: (context, child) {
        return Container(
          height: widget.containerHeightAnimation.value,
          child: Listener(
            onPointerMove: (PointerMoveEvent moveEvent) {
              if (moveEvent.delta.dy > 0) {
                if (widget.animationController.status !=
                    AnimationStatus.completed) {
                  cardsOpen = true;
                  widget.animationController.forward();
                }
              }
              if (moveEvent.delta.dy < 0) {
                if (widget.animationController.status ==
                    AnimationStatus.completed) {
                  cardsOpen = false;
                  widget.animationController.reverse();
                }
              }
            },
            child: Stack(
              children: [
                for (int i = 0; i < Constant.cardModel.length; i++)
                  Positioned(
                    top: getTop(i),
                    left: 27,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(
                            widget.cardXAnimation.value + ((i + 1) * 5) / 100),
                      alignment: FractionalOffset.center,
                      child: Transform.scale(
                        scale: widget.cardSize.value + (i + 1) / 100,
                        child: CreditCard(
                          height: height,
                          width: width,
                          cardModel: Constant.cardModel[i],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  double getTop(int i) {
    return (i * 1 +
        i * 10 +
        i * widget.cardTransform.value * 46 +
        ((widget.containerHeightAnimation.value -
                Constant.cardContainerHeightBegin) /
            2) as double);
  }
}

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.height,
    required this.width,
    required this.cardModel,
  }) : super(key: key);

  final double height;
  final double width;
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + 10,
      width: width - 54,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        gradient: new LinearGradient(
          colors: cardModel.borderContainer1,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 0.5, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Container(
        height: height + 10,
        width: width - 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          gradient: new LinearGradient(
            colors: cardModel.borderContainer2,
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            stops: [0.0, 0.5],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: new LinearGradient(
              colors: cardModel.bottomContainer,
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.9, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: ClipPath(
            clipper: CardShinyClipper(),
            child: Container(
              height: height,
              width: width - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: new LinearGradient(
                  colors: cardModel.topCurveContainer,
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      cardModel.title.toUpperCase(),
                      style: GoogleFonts.openSans(
                        letterSpacing: 2.0,
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
