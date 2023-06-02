import 'package:flutter/material.dart';

class TextDelegateHeaderWidget extends SliverPersistentHeaderDelegate {
  String? title;
  TextDelegateHeaderWidget({this.title,});

  @override
  Widget build(BuildContext context, double shrinkOffSet, bool overlapsContent,) {
    return const Placeholder();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }
}
