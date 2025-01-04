import 'package:crossword_pal/models/crossword_cell.dart';

enum CrosswordDirection {
  across,
  down,
}

class Crossword {
  final List<List<CrosswordCell>> cells;
  final Map<int, String> clues;

  Crossword({
    required this.cells,
    Map<int, String>? clues,
  }) : clues = clues ?? {};

  factory Crossword.grid(
    int length,
    int breadth,
  ) {
    if (length < breadth) {
      (length, breadth) = (breadth, length);
    }
    return Crossword(
      cells: [
        for (int i = 0; i < breadth; ++i)
          List.filled(
            length,
            const BlankCell(),
          ),
      ],
    );
  }

  bool solveForWord(
    int a,
    int b,
    CrosswordDirection direction,
    String test,
  ) {
    final indexCheck = a < cells.length && b < cells[0].length;
    if (!indexCheck) {
      return false;
    }
    final l = test.length;
    final lengthCheck = (a + l) < cells.length && (b + l) < cells[0].length;
    if (!lengthCheck) {
      return false;
    }
    final isStartingCheck = switch (cells[a][b]) {
      FillableCell(
        clueNumber: int(),
      ) =>
        true,
      _ => false,
    };
    if (!isStartingCheck) {
      return false;
    }
    switch (direction) {
      case CrosswordDirection.across:
        final row = cells[a];
        final end = b + l;
        for (var i = b; i < end; ++i) {
          final cell = row[i];
          final cellCheck = _solveForCell(
            cell,
            test[i - l],
          );
          if (!cellCheck) {
            return false;
          }
        }
        return true;
      case CrosswordDirection.down:
        final end = a + l;
        for (var i = a; i < end; ++i) {
          final cell = cells[i][b];
          final cellCheck = _solveForCell(
            cell,
            test[i - l],
          );
          if (!cellCheck) {
            return false;
          }
        }
        return true;
    }
  }

  bool _solveForCell(
    CrosswordCell cell,
    String ch,
  ) {
    switch (cell) {
      case BlockedCell():
        return false;
      case FilledCell(
            :final character,
          )
          when character != ch:
        return false;
      case _:
        return true;
    }
  }
}
