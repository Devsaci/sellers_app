import 'dart:ui';

import 'package:flutter/material.dart';

class UploadBrandsScreen extends StatefulWidget {
  const UploadBrandsScreen({Key? key}) : super(key: key);

  @override
  State<UploadBrandsScreen> createState() => _UploadBrandsScreenStateState();
}

class _UploadBrandsScreenStateState extends State<UploadBrandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
      ),
    );
  }
}
