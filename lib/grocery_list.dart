import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sandbox/Logic/grocery_sort.dart';
import 'package:sandbox/Widget/groceryItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class groceryList extends StatefulWidget {
  const groceryList({Key? key}) : super(key: key);

  @override
  State<groceryList> createState() => _groceryListState();
}

class _groceryListState extends State<groceryList> {
  final itemController = TextEditingController();
  int selected = -1;

  List<String> items = [];
  int count = 0;

  Color _activeColor = Colors.black;

  _addItem(String item) {
    setState(() {
      items.add(item);
      count++;
      _saveItems();
    });
  }

  void _loadItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? savedItems = prefs.getStringList('items');

      if (savedItems != null) {
        setState(() {
          items = savedItems;
          count = savedItems.length;
        });
      }
    } catch (e) {
      // Handle potential exceptions, such as preferences not being available
      print('Error loading items: $e');
    }
  }

  void _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('items', items);
  }

  @override
  Widget build(BuildContext context) {
    _loadItems();
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: count,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _removeItemPrompt(index);
                  },
                  child: groceryItem(item: items[index]),
                );
              },
            ),
          ),
          Row(
            children: [
              IconButton(
                color: _activeColor,
                iconSize: 30,
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  if (_activeColor == Colors.red) {
                    _removeItem(selected);
                  }
                },
              ),
              Expanded(
                child: TextField(
                  controller: itemController,
                  decoration: InputDecoration(hintText: "Add Item"),
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                ),
              ),
              IconButton(
                iconSize: 30,
                color: _activeColor,
                icon: Icon(Icons.add),
                onPressed: () {
                  if (_activeColor == Colors.black) {
                    _addItem(itemController.text);
                  }
                },
              ),
              IconButton(
                iconSize: 30,
                color: _activeColor,
                icon: Icon(Icons.sort),
                onPressed: () {
                  if (_activeColor == Colors.black) {
                    _sortItems(items);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _removeItemPrompt(int index) {
    setState(() {
      if (_activeColor == Colors.black) {
        _activeColor = Colors.red;
        selected = index;
      } else {
        _activeColor = Colors.black;
        selected = -1;
      }
    });
  }

  void _removeItem(int selected) {
    setState(() {
      count--;
      items.removeAt(selected);
      _saveItems();
      if (count == 0) {
        _activeColor = Colors.black;
      }
    });
  }

  void _sortItems(List<String> items) {
    setState(() {
      this.items = grocerySort(items) as List<String>;
      _saveItems();
    });
  }
}
