import 'package:card_animation/models/card_model.dart';
import 'package:flutter/material.dart';

class Constant {
  static const double cardContainerHeightBegin = 250;
  static const double cardContainerHeightEnd = 500;

  static List<CardModel> cardModel = [
    CardModel(
      title: "Executive Card",
      amount: 1163,
      borderContainer1: [
        const Color(0xFF8c8a9e),
        const Color(0xFFc2c0cf),
        const Color(0xFFbdbbbd),
      ],
      borderContainer2: [
        const Color(0xFF747281).withOpacity(0.7),
        const Color(0xFFC0BEC0).withOpacity(0.1),
      ],
      bottomContainer: [
        const Color(0xFF747281),
        const Color(0xFFC0BEC0),
        const Color(0xFFC0BEC0),
      ],
      topCurveContainer: [
        const Color(0xFF7f7d8c),
        const Color(0xFFc7c5c7),
      ],
    ),
    CardModel(
      title: "Gift Card",
      amount: 1163,
      borderContainer1: [
        const Color(0xFF161215),
        const Color(0xFF615c61),
        const Color(0xFF403c40),
      ],
      borderContainer2: [
        const Color(0xFF161215).withOpacity(0.7),
        const Color(0xFF4a474a).withOpacity(0.1),
      ],
      bottomContainer: [
        const Color(0xFF161215),
        const Color(0xFF4a474a),
        const Color(0xFF4a474a),
      ],
      topCurveContainer: [
        const Color(0xFF1f191d),
        const Color(0xFF595659),
      ],
    ),
    CardModel(
      title: "Food Card",
      amount: 1163,
      borderContainer1: [
        const Color(0xFFC26C2C),
        const Color(0xFFf5b87a),
        const Color(0xFFf2a250),
      ],
      borderContainer2: [
        const Color(0xFFC26C2C).withOpacity(0.7),
        const Color(0xFFC26C2C).withOpacity(0.1),
      ],
      bottomContainer: [
        const Color(0xFFC26C2C),
        const Color(0xFFe09241),
        const Color(0xFFECA760),
      ],
      topCurveContainer: [
        const Color(0xFFc47131),
        const Color(0xFFeba663),
      ],
    ),
    CardModel(
      title: "Gift Card",
      amount: 1163,
      borderContainer1: [
        const Color(0xFF181442),
        const Color(0xFF595394),
        const Color(0xFF433E7C),
      ],
      borderContainer2: [
        const Color(0xFF181442).withOpacity(0.9),
        const Color(0xFF2E2960).withOpacity(0.1),
      ],
      bottomContainer: [
        const Color(0xFF181442),
        const Color(0xFF3E3976),
        const Color(0xFF433E7C),
      ],
      topCurveContainer: [
        const Color(0xFF1d1a47),
        const Color(0xFF433E7C),
      ],
    ),
  ];
}
