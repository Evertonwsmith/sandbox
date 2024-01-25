import 'package:flutter/material.dart';
import 'package:sandbox/Styles/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notepad extends StatefulWidget {
  const Notepad({super.key});

  @override
  State<Notepad> createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {
  Color saveColor = Colors.black;
  bool textChanged = false;
  late TextEditingController _controller;
  late SharedPreferences _prefs;

  @override
  void initState() {
    _controller = TextEditingController();
    _loadNotes();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadNotes() async {
    _prefs = await SharedPreferences.getInstance();
    String? notes = _prefs.getString('notes');
    if (notes != null) {
      _controller.text = notes;
    }
  }

  void _saveNotes() async {
    if (textChanged == true) {
      _prefs = await SharedPreferences.getInstance();
      _prefs.setString('notes', _controller.text);
      setState(() {
        textChanged = false;
        saveColor = Colors.black;
        print('back');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
        elevation: 0,
        titleTextStyle: mainBlack,
        titleSpacing: 15,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300]),
              padding: const EdgeInsets.all(50),
              child: TextField(
                onChanged: (String _) => _textChanged(),
                controller: _controller,
                showCursor: true,
                maxLines: null,
                minLines: 20,
                decoration: InputDecoration(
                  hintText: 'Enter your note here',
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                color: saveColor,
                iconSize: 50,
                icon: Icon(Icons.save),
                onPressed: _saveNotes,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _textChanged() async {
    if (!textChanged) {
      setState(() {
        saveColor = Colors.red;
        textChanged = true;
        print('touched');
      });
    }
  }
}
