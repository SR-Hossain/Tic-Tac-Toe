import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  final String cellData;

  const GridCell({super.key, required this.cellData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Text(cellData),
    );
  }
}
