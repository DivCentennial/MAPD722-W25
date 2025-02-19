import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagesScreenState();
  }
}

class _ImagesScreenState extends State<ImagesScreen> {
  File? _localImage;

  Future<void> _pickAnImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _localImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Images APP")),
      body: Column(children: [
        const Text(
          "Assets Image",
          style: TextStyle(fontSize: 18),
        ),
        Image.asset(
          "assets/summer.jpg",
          height: 150,
          fit: BoxFit.cover,
        ),
        const Text("Network Image", style: TextStyle(fontSize: 18)),
        Image.network(
          "https://images.freeimages.com/images/large-previews/56d/peacock-1169961.jpg?fmt=webp&w=500",
          height: 150,
          fit: BoxFit.cover,
          // loadingBuilder: (context, child, loadingProgress) {
          //   if (loadingProgress == null) return child;
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // },
        ),
        const Text("Local File Image", style: TextStyle(fontSize: 18)),
        _localImage != null
            ? Image.file(
                _localImage!,
                height: 150,
                fit: BoxFit.cover,
              )
            : const Text("No Image Yet"),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  _pickAnImage(ImageSource.camera);
                },
                child: const Text("Take a Photo")),
            ElevatedButton(
                onPressed: () {
                  _pickAnImage(ImageSource.gallery);
                },
                child: const Text("Pick an Image"))
          ],
        )
      ]),
    );
  }
}
