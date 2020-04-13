import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: AssetImage('image/fluctron.png'),
                  width: 50.0,
                  height: 50.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'MUSIC STREAMING',
                  style: TextStyle(letterSpacing: 2.0, fontSize: 18.0),
                ),
                Text(
                  'v0.0.1',
                  style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.grey,
                      fontSize: 12.0,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.queue_music),
                  title: Text(
                    'All Songs',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text(
                    'Albums',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(
                    'Artists',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Setting',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://www.theclashofnews.com/wp-content/uploads/2019/12/maxresdefault-1-1.jpg",
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://imgs.capitalfm.com/images/16688?crop=16_9&width=660&relax=1&signature=0bl7l9-thZtoAUH-Ed4Rq70ndV4=",
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
