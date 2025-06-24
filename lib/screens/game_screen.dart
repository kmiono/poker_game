import 'package:flutter/material.dart';
import '../models/game_state.dart';
import '../logic/poker_logic.dart';
import '../widgets/table_widget.dart';
import '../widgets/card_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameState game;

  @override
  void initState() {
    super.initState();
    game = GameState();
    game.deal();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("テキサスホールデム")),
      body: Column(
        children: [
          TableWidget(gameState: game),
          for (var p in game.players)
            Column(
              children: [
                Text(p.name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: p.hand.map((c) => CardWidget(card: c)).toList(),
                )
              ],
            ),
          ElevatedButton(
            onPressed: () {
              final winner =
                  PokerLogic.determineWinner(game.players, game.communityCards);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("勝者: ${winner.name}"),
                ),
              );
            },
            child: Text("勝敗判定"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                game = GameState();
                game.deal();
              });
            },
            child: Text("再スタート"),
          ),
        ],
      ),
    );
  }
}
