// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  //slect image

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Select Image from'),
            children: [
              //from camera
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Camera"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              // from gallery
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Choose from Gallery"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () => _selectImage(context),
                icon: Icon(Icons.upload)))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              title: const Text(' Post to'),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Post",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ))
              ],
            ),
            body: Column(
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://media.istockphoto.com/photos/close-up-of-small-blue-gray-mobile-home-with-a-front-and-side-porch-picture-id1297687835?b=1&k=20&m=1297687835&s=170667a&w=0&h=Kj4yvWxQxYo_fc9801IJZrHCAXa06LNsiRLjovVfoQQ="
                          // userProvider.getUser.photoUrl,
                          ),
                    ),
                    SizedBox(
                      width: 250.0,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            hintText: "Write a caption...",
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 45.0,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            // image: MemoryImage(_file!),
                            image: NetworkImage(
                                'https://media.istockphoto.com/photos/close-up-of-small-blue-gray-mobile-home-with-a-front-and-side-porch-picture-id1297687835?b=1&k=20&m=1297687835&s=170667a&w=0&h=Kj4yvWxQxYo_fc9801IJZrHCAXa06LNsiRLjovVfoQQ='),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          );
  }
}

// TODO: 3:10 selecting image
