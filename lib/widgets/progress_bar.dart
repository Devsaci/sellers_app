
import 'package:flutter/material.dart';

linearProgressBar() {
  return Container(
    alignment: Alignment.center,
    child:  Padding(
      padding: const EdgeInsets.only(top: 14),
      child: LinearProgressIndicator(
        valueColor:const AlwaysStoppedAnimation(Colors.yellowAccent),
        minHeight: 25,backgroundColor: Colors.black,borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
