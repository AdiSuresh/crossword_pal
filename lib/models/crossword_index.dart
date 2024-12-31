import 'package:crossword_cracker/models/crossword.dart';

sealed class CrosswordIndex {
  final int clueNumber;
  final CrosswordDirection direction;

  CrosswordIndex({
    required this.clueNumber,
    required this.direction,
  });
}

final class CrosswordClue extends CrosswordIndex {
  final String clue;

  CrosswordClue({
    required this.clue,
    required super.clueNumber,
    required super.direction,
  });
}

final class CrosswordAnswer extends CrosswordIndex {
  final String answer;

  CrosswordAnswer({
    required this.answer,
    required super.clueNumber,
    required super.direction,
  });
}
