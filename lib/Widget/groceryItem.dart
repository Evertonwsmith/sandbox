import 'package:flutter/material.dart';

class groceryItem extends StatelessWidget {
  final String item;

  const groceryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey[300],
          ),
          margin: const EdgeInsets.all(8.0),
          child: Text(
            item,
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      )
    ]);
  }

  void _activateDelete(String item) {
  }
}
