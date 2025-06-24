import 'card_model.dart';
import 'player_model.dart';
import 'dart:math';

class GameState {
  List<PlayingCard> deck = [];
  List<PlayingCard> communityCards = [];
  List<Player> players = [];
  int currentPlayerIndex = 0;

  GameState() {
    _initDeck();
    players = [Player(name: "Player 1"), Player(name: "Player 2")];
  }

  void _initDeck() {
    deck.clear();
    for (var suit in Suit.values) {
      for (var rank in Rank.values) {
        deck.add(PlayingCard(suit, rank));
      }
    }
    deck.shuffle(Random());
  }

  void deal() {
    for (var player in players) {
      player.reset();
      player.hand.add(deck.removeLast());
      player.hand.add(deck.removeLast());
    }

    communityCards.clear();
    for (int i = 0; i < 5; i++) {
      communityCards.add(deck.removeLast());
    }
  }
}
