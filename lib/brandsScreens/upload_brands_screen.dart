import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellers_app/widgets/progress_bar.dart';

import '../splashScreen/my_splash_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;

class UploadBrandsScreen extends StatefulWidget {
  const UploadBrandsScreen({Key? key}) : super(key: key);

  @override
  State<UploadBrandsScreen> createState() => _UploadBrandsScreenStateState();
}

class _UploadBrandsScreenStateState extends State<UploadBrandsScreen> {
  TextEditingController brandInfoTextEditingController =
      TextEditingController();
  TextEditingController brandTitleTextEditingController =
      TextEditingController();

  XFile? imgXFile;
  final ImagePicker imagePicker = ImagePicker();

  bool uploading = false;
  String downloadUrlImage = "";

  Future<void> validateUploadForm() async {
    if (imgXFile != null) {
      if (brandInfoTextEditingController.text.isNotEmpty &&
          brandTitleTextEditingController.text.isNotEmpty) {
        setState(() {
          uploading = true;
        });
        //1. upload image to storage - get downloadUrl
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        fStorage.Reference storageRef = fStorage.FirebaseStorage.instance
            .ref()
            .child("sellersBrandsImages")
            .child(fileName);
        fStorage.UploadTask uploadImageTask =
            storageRef.putFile(File(imgXFile!.path));
        fStorage.TaskSnapshot taskSnapshot =
            await uploadImageTask.whenComplete(() {});
        await taskSnapshot.ref.getDownloadURL().then((urlImage) {
          downloadUrlImage = urlImage;
        });
        //2. save brand info to firestore database

      } else {
        Fluttertoast.showToast(msg: "Please write brand info and brand title.");
      }
    } else {
      Fluttertoast.showToast(msg: "Please choose image.");
    }
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              onPressed: () {
                //validate upload form
                uploading == true ? null : validateUploadForm();
              },
              icon: const Icon(Icons.cloud_upload),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          //const SizedBox(height: 10,),
          uploading == true
              ? linearProgressBar()
              : Container(
                  color: Colors.deepOrange,
                ),
          const SizedBox(
            height: 14,
          ),
          //image
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 24 / 16,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: FileImage(File(imgXFile!.path)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.pinkAccent,
            thickness: 3,
          ),
          //brand info
          ListTile(
            leading: const Icon(
              Icons.perm_device_information,
              color: Colors.deepPurple,
            ),
            title: SizedBox(
              child: TextField(
                controller: brandInfoTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Brand Info",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          ),
          const Divider(
            color: Colors.pinkAccent,
            thickness: 3,
          ),
          //brand title
          ListTile(
            leading: const Icon(
              Icons.title,
              color: Colors.deepPurple,
            ),
            title: SizedBox(
              child: TextField(
                controller: brandTitleTextEditingController,
                decoration: const InputDecoration(
                    hintText: "brand title",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          ),
          const Divider(
            color: Colors.pinkAccent,
            thickness: 3,
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
              onPressed: () {
                Navigator.pop(context);
              },
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
    Navigator.pop(context);
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgXFile;
    });
  }

  captureImageWithPhoneCamera() async {
    Navigator.pop(context);
    imgXFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imgXFile;
    });
  }
}
