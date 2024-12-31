import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const shape = (8, 8);

  final grid = Expanded(
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        children: [
          for (final _ in Iterable.generate(22))
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                border: Border.all(),
              ),
            ),
        ],
      ),
    ),
  );

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
