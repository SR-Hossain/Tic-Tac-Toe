import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/widgets/grid_board/sub_widgets/grid_cell.dart';
import '../../resource/providers.dart';

class GridBoard extends ConsumerWidget {
  const GridBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridData = ref.watch(gridDataProvider);

    return GridView.count(
      crossAxisCount: 3, // Set the number of columns to 3
      mainAxisSpacing: 10, // Add spacing between grid cells
      crossAxisSpacing: 10,
      children: gridData.map((cellData) {
        return GridCell(cellData: cellData);
      }).toList(),
    );
  }
}
