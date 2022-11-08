import 'dart:ffi';

import 'package:becertified/home/details_screen.dart';
import 'package:becertified/home/home_icon_buttoms.dart';
import 'package:flutter/material.dart';
import 'color.dart';
import 'text_style.dart';
import 'model.dart';
import 'custom_paint.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectBtn = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: navigationBar(),
          ),
          Transform.rotate(
            origin: Offset(30, -60),
            angle: 2.4,
            child: Container(
              margin: EdgeInsets.only(
                left: 75,
                top: 40,
              ),
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [Color(0xFF25316D), Color(0xFF5F6F94)],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Change your life through learning! ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CatigoryW(
                            image: 'assets/icon/aws.png',
                            text: 'Amazon ',
                            color: Color(0xFF191555),
                            OnPressed: () => {},
                          ),
                          CatigoryW(
                            image: 'assets/icon/redhat.png',
                            text: 'Red Hat',
                            color: Color(0xFF191555),
                            OnPressed: () {},
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CatigoryW(
                            image: 'assets/icon/cisco.jpg',
                            text: 'Cisco Systems',
                            color: Color(0xFF191555),
                            OnPressed: () {},
                          ),
                          CatigoryW(
                            image: 'assets/icon/python.png',
                            text: 'Python',
                            color: Color(0xFF191555),
                            OnPressed: () {},
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CatigoryW(
                            image: 'assets/icon/Huawei.png',
                            text: 'Huawei',
                            color: Color(0xFF191555),
                            OnPressed: () {},
                          ),
                          CatigoryW(
                            image: 'assets/icon/oracle.png',
                            text: 'Oracle',
                            color: Color(0xFF191555),
                            OnPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer navigationBar() {
    return AnimatedContainer(
      height: 70.0,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: Color(0xFF25316D),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(selectBtn == 0 ? 0.0 : 20.0),
          topRight:
              Radius.circular(selectBtn == navBtn.length - 1 ? 0.0 : 20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < navBtn.length; i++)
            GestureDetector(
              onTap: () => setState(() => selectBtn = i),
              child: iconBtn(i),
            ),
        ],
      ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i ? true : false;
    var height = isActive ? 60.0 : 0.0;
    var width = isActive ? 50.0 : 0.0;
    return SizedBox(
      width: 75.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(milliseconds: 600),
              child: isActive
                  ? CustomPaint(
                      painter: ButtonNotch(),
                    )
                  : const SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              navBtn[i].imagePath,
              color: isActive ? selectColor : black,
              scale: 2,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              navBtn[i].name,
              style: isActive ? bntText.copyWith(color: selectColor) : bntText,
            ),
          ),
        ],
      ),
    );
  }
}
