import 'package:flutter/material.dart';
import 'package:fluctronmusicapp/widget/Customdrawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluctronmusicapp/model/UserData.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AllSongs extends StatefulWidget {
  @override
  _AllSongsState createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  Future<List<User>> _getsongs() async{
    var songData = await http.get("http://thehacktivist.tech/api_data/music_dataset.json");
    var jsonData = json.decode(songData.body);
    List<User> Users = [];
    for(var u in jsonData['SONGS_LIST']['songs']){
      User user = User(u['name'],u['length'],u['movie_name'],u['singer'],u['image_url']);
    Users.add(user);
    }
    return Users;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffffffff),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(icon: Icon(Icons.menu), onPressed: (){ _scaffoldKey.currentState.openDrawer(); }),
            backgroundColor: Color(0xfffabf01),
            expandedHeight: 210.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('All Songs',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    letterSpacing: 2.5,
                  )),
              background: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&w=1000&q=80",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              child: FutureBuilder(
                future: _getsongs(),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                    );
                  }else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data[index].Name,
                            style: TextStyle(
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold,
                          ),),
                          subtitle: Text(snapshot.data[index].Singer,style: TextStyle(fontSize: 12.0),),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data[index].pic_url),
                          ),
                          trailing: Text(snapshot.data[index].length),
                        );
                      },
                    );
                  }
                  },
              ),
            ),
          )
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
