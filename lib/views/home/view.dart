import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const shape = (8, 8);

  final tableKey = GlobalKey();

  var selectedCell = (0, 0);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      body: Column(
        children: [
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final (a, b) = shape;
                const spacing = 30;
                final tableDimension = constraints.maxWidth - spacing;
                final cellSize = tableDimension / a;
                final table = Table(
                  border: TableBorder.all(
                    color: Colors.black,
                  ),
                  children: [
                    for (final i in Iterable.generate(a))
                      TableRow(
                        children: [
                          for (final j in Iterable.generate(b))
                            TableCell(
                              child: Builder(
                                builder: (context) {
                                  final cell = (i, j);
                                  const duration = Duration(
                                    milliseconds: 150,
                                  );
                                  final selected = cell == selectedCell;
                                  final scale = switch (selected) {
                                    true => 1.25,
                                    _ => 1.0,
                                  };
                                  final result = SizedBox(
                                    width: cellSize,
                                    height: cellSize,
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
                                      if (selected) {
                                        return;
                                      }
                                      setState(() {
                                        selectedCell = (i, j);
                                      });
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
                            ),
                        ],
                      ),
                  ],
                );
                return SizedBox(
                  key: tableKey,
                  width: tableDimension,
                  child: table,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(tableKey.currentContext?.size);
        },
      ),
    );
    return SafeArea(
      child: scaffold,
    );
  }
}
