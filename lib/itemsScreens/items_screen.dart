import 'package:flutter/cupertino.dart';
import 'package:sellers_app/models/brands.dart';

class ItemsScreen extends StatefulWidget {
  final Brands? model;

  const ItemsScreen({Key? key, this.model}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
