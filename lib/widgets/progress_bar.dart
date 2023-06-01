import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

linearProgressBar() {
  return Container(
    child: const LinearProgressIndicator(
      valueColor:AlwaysStoppedAnimation(Colors.pinkAccent),
    ),
  );
}
