
import 'package:flutter/material.dart';

linearProgressBar() {
  return Container(
    alignment: Alignment.center,
    child: const Padding(
      padding: EdgeInsets.only(top: 14),
      child: LinearProgressIndicator(
        valueColor:AlwaysStoppedAnimation(Colors.pinkAccent),
      ),
    ),
  );
}
