import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/presentation/notifiers/providers.dart';
import 'package:tic_tac_toe/presentation/widgets/grid_board/grid_board.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends ConsumerState<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final gridHeight =
        screenHeight * 0.6; // Adjust the multiplier to set desired grid height

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        actions: [
          IconButton(
              onPressed: () {
                resetProviders(ref);
              },
              icon: const Icon(Icons.refresh))
        ],
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 10, 51, 102),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SizedBox(
          height: gridHeight,
          child: const GridBoard(),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 3, 27, 58),
    );
  }
}
