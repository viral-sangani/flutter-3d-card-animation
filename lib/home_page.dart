import 'package:card_animation/components/card_details.dart';
import 'package:card_animation/components/cards_container.dart';
import 'package:card_animation/components/spend_container.dart';
import 'package:card_animation/components/topbar.dart';
import 'package:card_animation/components/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<dynamic> containerHeightAnimation;
  late Animation<dynamic> cardHeightAnimation;
  late Animation<dynamic> cardXAnimation;
  late Animation<double> cardSize;
  late Animation<double> cardTransform;
  late Animation<double> spendContainerOpacity;

  late bool isDetailOpen;
  int? selectedCard;
  @override
  void initState() {
    super.initState();
    isDetailOpen = false;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    containerHeightAnimation = Tween(
      begin: Constant.cardContainerHeightBegin,
      end: Constant.cardContainerHeightEnd,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutQuad,
        reverseCurve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    cardHeightAnimation = Tween(
      begin: 0.0,
      end: 0.5,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.2, curve: Curves.easeInOutQuint),
        reverseCurve: Interval(0.9, 1.0, curve: Curves.fastLinearToSlowEaseIn),
      ),
    );

    cardXAnimation = Tween(begin: 0.00, end: 0.42).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeIn,
      ),
    );

    cardSize = Tween(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInExpo,
      ),
    );

    cardTransform = Tween<double>(begin: 0, end: 0.1).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 0.2, curve: Curves.easeIn),
      reverseCurve: Interval(0.95, 1, curve: Curves.easeOut),
    ));

    spendContainerOpacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  void updateIsDetailOpen(bool value, int? index) {
    setState(() {
      isDetailOpen = value;
      selectedCard = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopBar(
              isDetailOpen: isDetailOpen,
              selectedCard: selectedCard,
            ),
            CardsContainer(
              animationController: animationController,
              containerHeightAnimation: containerHeightAnimation,
              cardXAnimation: cardXAnimation,
              cardSize: cardSize,
              cardTransform: cardTransform,
              cardHeightAnimation: cardHeightAnimation,
              updateIsDetailOpen: updateIsDetailOpen,
            ),
            SizedBox(height: 20),
            isDetailOpen
                ? CardDetails(
                    spendContainerOpacity: spendContainerOpacity,
                    selectedCard: selectedCard)
                : SpendsContainer(
                    spendContainerOpacity: spendContainerOpacity,
                  ),
          ],
        ),
      ),
    );
  }
}
