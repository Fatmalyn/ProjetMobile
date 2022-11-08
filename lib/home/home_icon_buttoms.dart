import 'package:flutter/material.dart';

import 'details_screen.dart';

class CatigoryW extends StatefulWidget {
  String image;
  String text;
  Color color;
  final Function OnPressed;

  CatigoryW(
      {super.key,
      required this.image,
      required this.text,
      required this.color,
      required this.OnPressed});

  @override
  State<CatigoryW> createState() => _CatigoryWState();
}

class _CatigoryWState extends State<CatigoryW> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 177,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFF97D2EC),
        ),
        child: Column(
          children: [
            Image.asset(
              widget.image,
              width: 120,
              height: 120,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.text,
              style: TextStyle(color: widget.color, fontSize: 18),
            ),
          ],
        ),
      ),
      onTap: OnPressed,
    );
  }

  void OnPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailsScreen();
    }));
  }
}
