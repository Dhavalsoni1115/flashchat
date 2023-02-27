import 'package:flutter/material.dart';

final textFieldDecorationName = InputDecoration(
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
  hintText: "Name",
  prefixIcon: Icon(
    Icons.person_outlined,
    color: Colors.black,
  ),
);

final textFieldDecorationEmail = InputDecoration(
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
  hintText: "Email",
  prefixIcon: Icon(
    Icons.email_outlined,
    color: Colors.black,
  ),
);

final textFieldDecorationPassword = InputDecoration(
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
  hintText: "Password",
  prefixIcon: Icon(
    Icons.key_outlined,
    color: Colors.black,
  ),
  // suffixIcon: Icon(
  //   Icons.remove_red_eye_outlined,
  //   color: Colors.grey,
  // ),
);
final textFieldDecorationConfirmPassword = InputDecoration(
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
  hintText: "Confirm Password",
  prefixIcon: Icon(
    Icons.key_off,
    color: Colors.black,
  ),
);
