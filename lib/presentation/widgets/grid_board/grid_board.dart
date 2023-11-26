import 'package:flutter/material.dart';
import 'package:tic_tac_toe/presentation/widgets/grid_board/grid_cell/grid_cell.dart';

class GridBoard extends StatelessWidget {
  const GridBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // Set the number of columns to 3
      mainAxisSpacing: 10, // Add spacing between grid cells
      crossAxisSpacing: 10,
      children: List.generate(9, (index) => GridCell(index: index)),
    );
  }
}
