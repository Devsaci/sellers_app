import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sellers_app/brandsScreens/upload_brands_screen.dart';
import 'package:sellers_app/global/global.dart';
import 'package:sellers_app/widgets/TextDelegateHeaderWidget.dart';

import '../widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.amber.shade300,
              Colors.amber.shade800,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
        ),
        title: const Text(
          "iShop",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => const UploadBrandsScreen(),
                    ));
              },
              icon: const Icon(
                Icons.abc_rounded,
              ))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: TextDelegateHeaderWidget(
              title: ("My Brand"),
            ),
          ),
          //1. write query
          //2  model
          //3. ui design widget
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("sellers")
                .doc(sharedPreferences!.getString("uid"))
                .collection("brands")
                .orderBy("publishedDate", descending: true)
                .snapshots(),
            builder: null, // ERROE
          )
        ],
      ),
    );
  }
}
