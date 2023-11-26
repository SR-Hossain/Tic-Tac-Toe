import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateNotifier, StateNotifierProvider, StateProvider, WidgetRef;

final player =
    StateNotifierProvider<PlayerTracker, String>((ref) => PlayerTracker("x"));

final cellFilled = StateProvider((ref) => 0);

List listOfNineEmptyStrings = ['', '', '', '', '', '', '', '', ''];

class BoardTap extends StateNotifier<List> {
  BoardTap(super.state);

  bool checkBoard(WidgetRef ref, int index) {
    int row = index ~/ 3;
    int column = index % 3;
    // state[index] = 'hello';
    return ((state[row * 3] == state[row * 3 + 1] &&
            state[row * 3 + 2] == state[row * 3 + 1]) ||
        (state[column] == state[3 + column] &&
            state[3 + column] == state[6 + column]) ||
        (state[0] == state[index] &&
            state[0] == state[4] &&
            state[4] == state[8]) ||
        (state[2] == state[index] &&
            state[2] == state[4] &&
            state[2] == state[6]));
  }

  bool isTapped(WidgetRef ref, int index) {
    if (state[index] == '') {
      state[index] = ref.watch(player).toString();
      checkBoard(ref, index);
      ref.read(player.notifier).toggle();
      ref.read(cellFilled.notifier).state++;
      return true;
    }
    return false;
  }

  void reset() {
    state = ['', '', '', '', '', '', '', '', ''];
  }
}

class PlayerTracker extends StateNotifier<String> {
  PlayerTracker([super.state = 'x']);

  void toggle() {
    if (state == 'x') {
      state = 'o';
    } else {
      state = 'x';
    }
  }

  void reset() {
    state = 'x';
  }
}

final gridDataProvider = StateNotifierProvider<BoardTap, List>(
    (ref) => BoardTap(listOfNineEmptyStrings));

void resetProviders(WidgetRef ref) {
  try {
    ref.read(gridDataProvider.notifier).reset();
    ref.read(player.notifier).reset();
    ref.refresh(cellFilled);
  } on Exception catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
