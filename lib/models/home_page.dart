import 'package:card_animation/models/cards_container.dart';
import 'package:card_animation/models/components/spend_container.dart';
import 'package:card_animation/models/components/topbar.dart';
import 'package:card_animation/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<dynamic> containerHeightAnimation;
  late Animation<dynamic> cardXAnimation;
  late Animation<double> cardSize;
  late Animation<double> cardTransform;
  late Animation<double> spendContainerOpacity;

  @override
  void initState() {
    super.initState();
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
        curve: Curves.easeOut,
        reverseCurve: Curves.easeOut,
      ),
    );

    cardXAnimation = Tween(begin: 0.00, end: 0.42).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeOut,
      ),
    );

    cardSize = Tween(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    cardTransform = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    spendContainerOpacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
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
            TopBar(),
            CardsContainer(
              containerHeightAnimation: containerHeightAnimation,
              animationController: animationController,
              cardXAnimation: cardXAnimation,
              cardSize: cardSize,
              cardTransform: cardTransform,
            ),
            SpendsContainer(
              spendContainerOpacity: spendContainerOpacity,
            ),
          ],
        ),
      ),
    );
  }
}
