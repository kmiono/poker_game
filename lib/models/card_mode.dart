enum Suit { hearts, diamonds, clubs, spades }

enum Rank {
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
  ace
}

class PlayingCard {
  final Suit suit;
  final Rank rank;

  PlayingCard(this.suit, this.rank);

  String get display => '${rank.name} of ${suit.name}';
}
