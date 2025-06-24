import '../models/card_model.dart';
import '../models/player_model.dart';

class PokerLogic {
  static Player determineWinner(
      List<Player> players, List<PlayingCard> communityCards) {
    int score(Player p) {
      return p.hand.map((c) => c.rank.index).fold(0, (a, b) => a + b);
    }

    players.sort((a, b) => score(b) - score(a));
    return players.first;
  }
}
