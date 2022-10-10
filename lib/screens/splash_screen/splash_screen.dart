import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_to_pdf/screens/main_screen/main_screen.dart';

import '../../constant/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds:2),()=>Get.to(const MainScreen()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
          body: Center(
            child: Image.asset("assets/logo/logo.png",scale: width *0.008,),
          ),
        ),
    );
  }
}
