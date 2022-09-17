import 'dart:async';
import 'package:get/get.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'input_page.dart';

String? userSID;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  Future getValidationData() async {
    final prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString("ID");
    setState(() {
      userSID = userId;
    });
  }

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(const Duration(seconds: 5), () {
        Get.offAll(userSID == null ? const Input() : const Navigate());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      loaderColor: Colors.white,
      logoSize: 200,
      logo: const Image(
        image: AssetImage("assets/Daily-Routine.jpg"),
      ),
      title: const Text(
        "Miu Class Routine",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: HexColor("071140"),
      showLoader: true,
      loadingText: const Text(
        "Loading...",
        style: TextStyle(color: Colors.white),
      ),
      durationInSeconds: 3,
    );
  }
}
