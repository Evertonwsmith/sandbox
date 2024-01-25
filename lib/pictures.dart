import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sandbox/Widget/picture.dart';

class pictures extends StatefulWidget {
  const pictures({super.key});

  @override
  State<pictures> createState() => _PicturesState();
}

class _PicturesState extends State<pictures> {
  List<String> pictures = [];
  int count = 0;
  int selected = -1;
  Color activeDelete = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pictures"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: count,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        print('click');
                        print(index.toString());
                        selected = index;
                        _deleteImage();
                      });
                    },
                    child: picture(src: Image.file(File(pictures[index]))));
                // return Container(
                //   child: Image.file(File(pictures[index])),
                // );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Colors.black,
                  iconSize: 50,
                  icon: Icon(Icons.add_a_photo_outlined),
                  onPressed: _uploadImage,
                ),
                IconButton(
                    color: activeDelete,
                    iconSize: 50,
                    icon: Icon(Icons.delete_outline),
                    onPressed: deleteSelected),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _uploadImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }

    setState(() {
      pictures.add(image.path);
      count++;
    });
  }

  void _deleteImage() {
    if (activeDelete == Colors.black) {
      print('should turn red');
      setState(() {
        activeDelete = Colors.red;
      });
    }
    else if (activeDelete == Colors.red) {
      print('should turn black');
      setState(() {
        activeDelete = Colors.black;
      });
    }
  }

  void deleteSelected() {
    print('trash');
    if (activeDelete == Colors.red) {
      setState(() {
        pictures.removeAt(selected);
        print('selected trashed');
        count--;
        activeDelete = Colors.black;
      });
    }
  }
}
