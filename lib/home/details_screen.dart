import 'package:becertified/home/color.dart';
import 'package:becertified/home/details_icons.dart';
import 'package:flutter/material.dart';

import 'custom_paint.dart';
import 'model.dart';
import 'text_style.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  int selectBtn = 0;
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: bgColor,
      body: Stack(children: [
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'AWS Training,',
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
              'Learn AWS-some cloud skills.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CatigoryW2(
                        image: 'assets/icon/cloud1.png',
                        text:
                            'This certification validates cloud proficiency and basic knowledge related to AWS. ',
                        color: Color(0xFF191555),
                      ),
                      CatigoryW2(
                        image: 'assets/icon/aws2.png',
                        text:
                            'This certification validates the ability to develop and deploy cloud-based applications.',
                        color: Color(0xFF191555),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CatigoryW2(
                        image: 'assets/icon/aws3.png',
                        text:
                            'This certification validates expertise in designing and maintaining a network architecture for all AWS services.',
                        color: Color(0xFF191555),
                      ),
                      CatigoryW2(
                        image: 'assets/icon/aws4.png',
                        text:
                            'This certification validates expertise in using AWS data lakes and analytics services to gain insights from data.',
                        color: Color(0xFF191555),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ])),
          ]),
        )
      ]));

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
