import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Screen2 extends StatefulWidget {
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context, "hello");
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: const Text("ADD POST"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: selectedImage == null
                        ? const Icon(
                            Icons.add,
                            size: 40,
                          )
                        : Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                      hintText: 'Post Content',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Add new Post'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(file!.path);
    setState(() {});
  }
}
