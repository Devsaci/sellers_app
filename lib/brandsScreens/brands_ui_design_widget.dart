import 'package:flutter/material.dart';

import '../models/brands.dart';

class BrandsUiDesignWidget extends StatefulWidget {
  Brands? model;
  BuildContext? context;


  BrandsUiDesignWidget(this.model, this.context, {super.key});

  @override
  State<BrandsUiDesignWidget> createState() => _BrandsUiDesignWidgetState();
}

class _BrandsUiDesignWidgetState extends State<BrandsUiDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 10,
      shadowColor: Colors.black,
    );
  }
}
