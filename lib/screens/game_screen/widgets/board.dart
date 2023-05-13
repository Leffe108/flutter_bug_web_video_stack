
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:bug_web_stack/models/card_state.dart';
import 'package:bug_web_stack/screens/game_screen/widgets/memory_card_front_content.dart';

/// This widget renders the game board which will display a MemoryCard for
/// each CardState in the data array.
class Board extends StatelessWidget {
  final List<CardState> data;
  const Board({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.count(
        crossAxisCount: 4,
        children: [
          ...data
              .mapIndexed((int index, CardState cardState) =>
                  _buildMemoryCard(context, index, cardState))
              .toList(),
        ],
      );
    });
  }

  Widget _buildMemoryCard(
    BuildContext context,
    int index,
    CardState cardState,
  ) {
    return Padding(
      key: Key('$index grid-cell'),
      padding: const EdgeInsets.all(1),
      child: Center(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: MemoryCardFrontContent(
            sign: cardState.sign,
            completed: cardState.completed,
            key: Key('${cardState.sign.id} ${cardState.completed} memory-card-front-content'),
          ),
        ),
      ),
    );
  }
}
