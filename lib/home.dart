import 'package:flutter/material.dart';
import 'package:sandbox/Styles/fonts.dart';
import 'package:sandbox/Widget/homeButtons.dart';
import 'package:sandbox/grocery_list.dart';
import 'package:sandbox/notepad.dart';
import 'package:sandbox/calendar.dart';
import 'package:sandbox/pictures.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HOME')),
        elevation: 0,
        titleTextStyle: mainBlack,
        titleSpacing: 15,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

        children: [
          homeButtons(pageName: Notepad(),title: 'Shared Notepad'),
          homeButtons(pageName: groceryList(), title: 'Grocery List'),
          homeButtons(pageName: calendar(), title: 'Weekly Calendar',),
          homeButtons(pageName: pictures(), title: 'Pictures'),
        ],
      )),
    );
  }
}
