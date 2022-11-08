import 'package:flutter/material.dart';

class CatigoryW2 extends StatefulWidget {
  String image;
  String text;
  Color color;

  CatigoryW2({
    super.key,
    required this.image,
    required this.text,
    required this.color,
  });

  @override
  State<CatigoryW2> createState() => _CatigoryW2State();
}

class _CatigoryW2State extends State<CatigoryW2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 300,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFF97D2EC),
          ),
          child: Column(
            children: [
              Image.asset(
                widget.image,
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.text,
                style: TextStyle(color: widget.color, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              MaterialButton(
                color: Color(0xFF191555),
                height: 10,
                minWidth: 140,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xFF191555))),
                onPressed: () {},
                child: Text(
                  "Learn more »",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        onTap: () {});
  }
}
