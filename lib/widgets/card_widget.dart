import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardWidget extends StatelessWidget {
  final PlayingCard card;
  final bool faceUp;

  const CardWidget({required this.card, this.faceUp = true});

  @override
  Widget build(BuildContext context) {
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
            ? Center(
                child: Text(
                  card.display,
                  style: TextStyle(fontSize: 10),
                ),
              )
            : null);
  }
}
