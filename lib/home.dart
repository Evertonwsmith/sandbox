import 'package:flutter/material.dart';
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
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notepad(),
                  ),
                );
              },
              child: Text('Shared Notepad'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => calendar(),
                  ),
                );
              },
              child: Text('Shared Calendar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pictures(),
                  ),
                );
              },
              child: Text('Shared Pictures'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => groceryList(),
                  ),
                );
              },
              child: Text('Grocery List'),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ),
    );
  }
}
