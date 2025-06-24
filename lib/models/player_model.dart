import 'card_model.dart';

class Player {
  final String name;
  List<PlayingCard> hand = [];
  int chips;

  Player({required this.name, this.chips = 1000});

  void reset() => hand.clear();
}
