// import 'dart:html';
import 'package:bdma/common/helper.dart';
import 'package:bdma/scene/login.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget startButton() => SizedBox(
          height: 50,
          width: SizeConfig.ScreenWidth * 0.7,
          child: Container(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFFF0730F))),
              child: Text(
                "Get Started",
                style: TextStyle(
                    fontFamily: "Raleway", fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.ScreenHeight,
          width: SizeConfig.ScreenWidth,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 119,
              ),
              Container(
                child: Image.asset("assets/img/logo.png"),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                child: Text(
                  "BDMA Apps",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Beralih ke teknologi" + "\n" + "dalam genggaman tanganmu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Raleway",
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              startButton(),
            ],
          ),
        ),
      ),
    );
  }
}
