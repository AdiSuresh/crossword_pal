import 'package:flutter/material.dart';

class CellWidget extends StatelessWidget {
  final (int, int) cell;
  final double sideLength;

  const CellWidget({
    super.key,
    required this.cell,
    required this.sideLength,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Builder(
        builder: (context) {
          const duration = Duration(
            milliseconds: 150,
          );
          // final selected = cell == selectedCell;
          const selected = false;
          final scale = switch (selected) {
            true => 1.25,
            _ => 1.0,
          };
          final result = SizedBox(
            width: sideLength,
            height: sideLength,
            child: Center(
              child: AnimatedScale(
                scale: scale,
                duration: duration,
                child: Text(
                  'A',
                ),
              ),
            ),
          );
          return GestureDetector(
            onTap: () {
              // if (selected) {
              //   return;
              // }
              // setState(() {
              //   selectedCell = (i, j);
              // });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlue,
                  width: 2.5,
                  style: switch (selected) {
                    true => BorderStyle.solid,
                    _ => BorderStyle.none,
                  },
                ),
              ),
              duration: duration,
              child: result,
            ),
          );
        },
      ),
    );
  }
}
