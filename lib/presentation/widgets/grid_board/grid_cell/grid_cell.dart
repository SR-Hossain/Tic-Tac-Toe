import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../notifiers/providers.dart';
import '../../common_widgets.dart';

class GridCell extends ConsumerWidget {
  final int index;
  const GridCell({super.key, required this.index});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => handleCellTap(context, ref, index),
      child: Cell(childWidget: ref.watch(gridDataProvider)[index].toString()),
    );
  }
}

void handleCellTap(BuildContext context, WidgetRef ref, int index) {
  bool isTapSuccessful =
      ref.read(gridDataProvider.notifier).isTapped(ref, index);
  if (isTapSuccessful) {
    bool isCurrentPlayerWinner =
        ref.read(gridDataProvider.notifier).checkBoard(ref, index);
    bool gameWon = isCurrentPlayerWinner;
    bool gameIsDraw = (ref.watch(cellFilled) >= 9);
    if (gameWon) {
      gameIsDraw = false;
    }

    if (isCurrentPlayerWinner || gameIsDraw) {
      var curPlayer = ref.watch(gridDataProvider)[index];
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const TextWithSize('Game Over!'),
              content: TextWithSize(gameIsDraw?'Game Draw!':'$curPlayer has won the game!'),
              backgroundColor: Colors.green,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    resetProviders(ref);
                  },
                  child: const TextWithSize('Play Again!'),
                ),
              ],
            );
          });
    }
  }
}


