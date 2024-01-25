import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notepad extends StatefulWidget {

  const Notepad({super.key});

  @override
  State<Notepad> createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {

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
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('notes', _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
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
                color: Colors.black,
                iconSize: 50,
                icon: Icon(Icons.color_lens),
                onPressed: () {
                  // colorWheel();

                },
              ),
              IconButton(
                color: Colors.black,
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

}