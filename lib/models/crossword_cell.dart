sealed class CrosswordCell {
  const CrosswordCell();
}

sealed class FillableCell extends CrosswordCell {
  final int? clueNumber;

  const FillableCell({
    required this.clueNumber,
  });
}

final class BlankCell extends FillableCell {
  const BlankCell({
    super.clueNumber,
  });
}

final class FilledCell extends FillableCell {
  final String character;

  FilledCell({
    required this.character,
    required super.clueNumber,
  }) : assert(character.length == 1);
}

final class BlockedCell extends CrosswordCell {
  const BlockedCell();
}
