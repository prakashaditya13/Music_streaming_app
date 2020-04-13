import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluctronmusicapp/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),NavigateHome);
  }
  void NavigateHome(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage('image/fluctron.png'),
                width: 70.0,
              height: 70.0,
            ),
            SizedBox(height: 10.0,),
            Text(
              'FLUCTRON',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontFamily: "Roboto",
              ),
            ),
          ],
        ),
      )
    );
  }
}
