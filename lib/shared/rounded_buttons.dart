// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String? text;
  IconData? icon;
  Function()? onTap;

  RoundedButton({Key? key, this.text, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        margin:
            EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0, bottom: 10.0),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(25)),
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(text!),
            Spacer(),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}

class RoundedElevatedButton extends StatelessWidget {
  String? label;
  IconData? icon;
  Function()? onPressed;

  RoundedElevatedButton({
    Key? key,
    this.label,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          fixedSize: Size(MediaQuery.of(context).size.width / 1.75, 30),
        ),
        icon: Icon(icon),
        label: FittedBox(child: Text(label!)));
  }
}
