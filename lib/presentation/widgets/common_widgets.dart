import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final childWidget;

  const Cell({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue[800],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Text(
        childWidget,
        style: const TextStyle(fontSize: 60),
      ),
    );
  }
}

class TextWithSize extends Text {
  const TextWithSize(super.data, {super.key});

  // @override
  @override
  TextStyle? get style => const TextStyle(fontSize: 20, color: Colors.white);
}
