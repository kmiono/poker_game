import 'package:flutter/material.dart';
import '../models/game_state.dart';
import 'card_widget.dart';

class TableWidget extends StatelessWidget {
  final GameState gameState;

  const TableWidget({required this.gameState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Community Cards"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: gameState.communityCards
              .map((card) => CardWidget(card: card))
              .toList(),
        )
      ],
    );
  }
}
