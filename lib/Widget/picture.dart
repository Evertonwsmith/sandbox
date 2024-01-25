import 'package:flutter/material.dart';

class picture extends StatelessWidget {
  final src;

  const picture({required this.src, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[300]),
            child: Column(
              children: [
                Text('Here\'s a picture'),
                src,
              ],
            )),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
