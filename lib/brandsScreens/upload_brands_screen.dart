import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../splashScreen/my_splash_screen.dart';

class UploadBrandsScreen extends StatefulWidget {
  const UploadBrandsScreen({Key? key}) : super(key: key);

  @override
  State<UploadBrandsScreen> createState() => _UploadBrandsScreenStateState();
}

class _UploadBrandsScreenStateState extends State<UploadBrandsScreen> {
  XFile? imgXFile;
  final ImagePicker imagePicker = ImagePicker();

  uploadFormScreen() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (c) => const MySplashScreen()));
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent.shade200,
              Colors.amber.shade900,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        )),
        title: const Text("Upload New Brand"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //image
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(
                        File(imgXFile!.path),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return imgXFile == null ? defaultScreen() : uploadFormScreen();
  }

  Scaffold defaultScreen() {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent.shade200,
              Colors.amber.shade900,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        )),
        title: const Text("Add New Brand"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent.shade200,
              Colors.amber.shade900,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_photo_alternate_outlined,
                  color: Colors.white, size: 200),
              ElevatedButton(
                onPressed: () {
                  obtainImageDialogBox();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text("Add New Brand"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  obtainImageDialogBox() {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            "Brand Image",
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
          children: [
            //"Capture image with Camera"
            SimpleDialogOption(
              onPressed: () {
                captureImageWithPhoneCamera();
              },
              child: const Text("Capture image with Camera",
                  style: TextStyle(color: Colors.grey)),
            ),
            //Select image from Gallery
            SimpleDialogOption(
              onPressed: () {
                getImageFromGallery();
              },
              child: const Text("Select image from Gallery",
                  style: TextStyle(color: Colors.grey)),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgXFile;
    });
  }

  captureImageWithPhoneCamera() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imgXFile;
    });
  }
}
