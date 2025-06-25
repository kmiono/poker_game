import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardWidget extends StatelessWidget {
  final PlayingCard card;
  final bool faceUp;

  const CardWidget({required this.card, this.faceUp = true});

  @override
  Widget build(BuildContext context) {
    // スート記号と色を取得
    String suitSymbol;
    Color suitColor;
    switch (card.suit) {
      case Suit.hearts:
        suitSymbol = '♥';
        suitColor = Colors.red;
        break;
      case Suit.diamonds:
        suitSymbol = '♦';
        suitColor = Colors.red;
        break;
      case Suit.clubs:
        suitSymbol = '♣';
        suitColor = Colors.black;
        break;
      case Suit.spades:
        suitSymbol = '♠';
        suitColor = Colors.black;
        break;
    }

    return Container(
        margin: EdgeInsets.all(4),
        width: 60,
        height: 90,
        decoration: BoxDecoration(
          color: faceUp ? Colors.white : Colors.blueGrey,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: faceUp
            ? Stack(
                children: [
                  Positioned(
                    left: 6,
                    top: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          card.rank.name.toUpperCase(),
                          style: TextStyle(
                              fontSize: 14,
                              color: suitColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          suitSymbol,
                          style: TextStyle(fontSize: 14, color: suitColor),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      suitSymbol,
                      style: TextStyle(fontSize: 32, color: suitColor),
                    ),
                  ),
                ],
              )
            : null);
  }
}
