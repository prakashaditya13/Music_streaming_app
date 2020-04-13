import 'package:flutter/material.dart';
import 'package:fluctronmusicapp/widget/Customdrawer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Albums extends StatefulWidget {
  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffffffff),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            leading: IconButton(icon: Icon(Icons.menu), onPressed: (){ _scaffoldKey.currentState.openDrawer(); }),
            backgroundColor: Color(0xff1b1b1b),
            expandedHeight: 210.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Albums',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 2.5,
                  )),
              background: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "https://c.wallhere.com/photos/6c/c1/Led_Zeppelin_album_covers-1394247.jpg!d",
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text(
                'Hello its All Albums',
              ),
            ),
          )
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
