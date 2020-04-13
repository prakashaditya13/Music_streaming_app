import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}
class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c2834),
      body: SafeArea(
        child: Text(
          'FLUCTRON MUSIC STREAMING APP',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            letterSpacing: 1.8
          ),
        ),
      ),
    );
  }
}
