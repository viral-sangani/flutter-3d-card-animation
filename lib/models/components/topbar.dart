import 'package:card_animation/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget {
  final bool isDetailOpen;
  final int? selectedCard;
  const TopBar({
    Key? key,
    required this.isDetailOpen,
    required this.selectedCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Icon(Icons.arrow_back),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: isDetailOpen ? 0 : 1,
                duration: Duration(milliseconds: 400),
                child: Text(
                  "All Cards",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
