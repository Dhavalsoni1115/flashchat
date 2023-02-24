import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  String name;
  VoidCallback onPress;
  NavigationButton({
    Key? key,
    required this.name,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: MaterialButton(
        color: Colors.orangeAccent.shade200,
        onPressed: onPress,
        child: Text(
          name,
          style: const TextStyle(fontSize: 25),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
