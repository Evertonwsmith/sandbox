import 'package:flutter/material.dart';

class dayOfWeek extends StatelessWidget {
  final String day;
  const dayOfWeek({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(day, style: TextStyle(fontSize: 9),),
      ),
    );
  }
}
