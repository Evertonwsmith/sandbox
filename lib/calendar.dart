import 'package:flutter/material.dart';
import 'package:sandbox/Styles/fonts.dart';
import 'package:sandbox/Widget/dayOfWeek.dart';
import 'package:shared_preferences/shared_preferences.dart';

class calendar extends StatefulWidget {
  calendar({super.key});

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  int week = 0;

  //0 = this week
  int day = 0;

  //0 = this day
  final _controller = TextEditingController();

  late SharedPreferences _sharedPreferences;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadNotes() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String? notes = _sharedPreferences.getString('week$week$day');
    if (notes != null) {
      _controller.text = notes;
    }
  }

  void _saveNotes() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString('week$week$day', _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    _loadNotes();
    return Scaffold(
        appBar: AppBar(
          title: Text("Calendar"),
          backgroundColor: Colors.grey[500],
          elevation: 0,
          titleTextStyle: mainWhite,
          titleSpacing: 15,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      week--;
                    });
                  },
                ),
                Text(week == 0
                    ? 'This Week'
                    : week > 0
                        ? 'This Week +' + week.toString()
                        : 'This Week -' + week.toString()),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      week++;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap:(){ setState(() {
                      day = 0;
                    });},
                    child: dayOfWeek(day: 'M')),
                dayOfWeek(day: 'T'),
                dayOfWeek(day: 'W'),
                dayOfWeek(day: 'Th'),
                dayOfWeek(day: 'F'),
                dayOfWeek(day: 'St'),
                dayOfWeek(day: 'Sn'),
              ],
            ),
            Expanded(
              child: Container(
                  width: 400,
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: TextField(
                    controller: _controller,
                    minLines: 20,
                    maxLines: 50,
                    decoration: InputDecoration(),
                    onChanged: (value) {
                      _saveNotes();
                    },
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.all(10),
                  iconSize: 50,
                  icon: Icon(Icons.save),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ));
  }
}
