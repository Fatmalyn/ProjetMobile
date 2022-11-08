import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            title: 'Getcertified',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: const Color(0xff4C53FB),
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            home: const HomePage(),
          );
        });
  }
}
