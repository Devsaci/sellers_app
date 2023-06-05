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
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 270,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.network(
                widget.model!.thumbnailUrl.toString(),
                height: 220,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 1),
              Row(children: [],)
            ],
          ),
        ),
      ),
    );
  }
}
