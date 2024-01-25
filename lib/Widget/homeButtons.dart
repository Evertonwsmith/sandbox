import 'package:flutter/material.dart';
import 'package:sandbox/Styles/fonts.dart';

class homeButtons extends StatelessWidget {
  final pageName;
  final String title;

  const homeButtons({super.key, required this.pageName, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pageName,
            ),
          );
        },
        child: Text(
          title,
          style: mainWhite,
        ));
  }
}
