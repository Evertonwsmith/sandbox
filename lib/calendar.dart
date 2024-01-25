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
  int day = 0;
  late SharedPreferences _sharedPreferences;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calendar"),
          elevation: 0,
          titleTextStyle: mainBlack,
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
                      _loadWeek();
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
                      _loadWeek();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (day > 0) {
                      setState(() {
                        _saveDay();
                        day--;
                        _loadDay();
                      });
                    }
                  },
                ),
                Text(day == 0
                    ? 'Monday'
                    : day == 1
                        ? 'Tuesday'
                        : day == 2
                            ? 'Wednesday'
                            : day == 3
                                ? 'Thursday'
                                : day == 4
                                    ? 'Friday'
                                    : day == 5
                                        ? 'Saturday'
                                        : day == 6
                                            ? 'Sunday'
                                            : day.toString()),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (day < 6) {
                      setState(() {
                        _saveDay();
                        day++;
                        _loadDay();
                      });
                    }
                  },
                ),
              ],
            ),
            //TODO: add horizontal row swipeable day containers
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.grey[150],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What\'s happenin today?',
                        hintStyle: mainBlack,
                      ),
                      minLines: 20,
                      maxLines: null,
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.all(10),
                  iconSize: 50,
                  icon: Icon(Icons.save),
                  onPressed: () {
                    _saveWeek();
                  },
                ),
              ],
            ),
          ],
        ));
  }

  Future<void> _loadWeek() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getInt('week$week');
    prefs.getString('weekNote$week$day');
  }

  Future<void> _loadDay() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getInt('day$week$day');
    prefs.getString('weekNote$week$day');
  }

  Future<void> _saveDay() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('day$week$day', day);
    prefs.setString('weekNote$week$day', _controller.text);
  }

  Future<void> _saveWeek() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('week$week', week);
    prefs.setInt('day$week$day', day);
    prefs.setString('weekNote$week$day', _controller.text);
  }
}
