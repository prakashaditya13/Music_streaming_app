import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluctronmusicapp/widget/allsong.dart';
import 'package:fluctronmusicapp/widget/album.dart';
import 'package:fluctronmusicapp/widget/artist.dart';
import 'package:fluctronmusicapp/widget/setting.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color bottomNaviColorChange = Color(0xfffabf01);
  var currentIndex = 0;
  Color IconChn = Colors.black;
  @override
  Widget build(BuildContext context) {
    var CurrentTab = [
      AllSongs(),
      Albums(),
      Artists(),
      Setting()
    ];
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: CurrentTab[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 45.0,
        color: bottomNaviColorChange,
        backgroundColor: currentIndex==3 ? Color(0xff1c2834) : Colors.white ,
        items: <Widget>[
          Icon(
            Icons.queue_music,
            size: 15.0,
            color: IconChn,
          ),
          Icon(
            Icons.album,
            size: 15.0,
            color: IconChn,
          ),
          Icon(
            Icons.account_circle,
            size: 15.0,
            color: IconChn,
          ),
          Icon(
            Icons.settings,
            size: 15.0,
            color: IconChn,
          ),
        ],
        onTap: (index) {
          //debugPrint("Current index is : $index");
          if (index == 2) {
            setState(() {
              currentIndex = index;
              bottomNaviColorChange = Color(0xffe3c299);
              IconChn = Colors.black;
            });
          } else if (index == 1) {
            setState(() {
              currentIndex = index;
              bottomNaviColorChange = Color(0xff1b1b1b);
              IconChn = Colors.white;
            });
          } else if (index == 0) {
            setState(() {
              currentIndex = index;
              bottomNaviColorChange = Color(0xfffabf01);
              IconChn = Colors.black;
            });
          } else {
            setState(() {
              currentIndex = index;
              bottomNaviColorChange = Color(0xff152131);
              IconChn = Color(0xffffffff);
            });
          }
        },
        animationDuration: Duration(milliseconds: 500),
      ),
    );
  }
}
