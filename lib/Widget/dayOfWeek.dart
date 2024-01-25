import 'package:flutter/material.dart';

class dayOfWeek extends StatelessWidget {
  final String day;
  final TextEditingController controller;

  const dayOfWeek({super.key, required this.day, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
            child: TextField(controller: controller,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold))));
  }
}
