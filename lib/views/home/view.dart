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
                              child: SizedBox(
                                width: cellSize,
                                height: cellSize,
                                child: Center(
                                  child: Text(
                                    'A',
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                );
                return SizedBox(
                  width: tableDimension,
                  child: table,
                );
              },
            ),
          ),
        ],
      ),
    );
    return SafeArea(
      child: scaffold,
    );
  }
}
