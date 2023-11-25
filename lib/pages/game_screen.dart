import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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
    return const Text('kire bolod sami');
  }
}
