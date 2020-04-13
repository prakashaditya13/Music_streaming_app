import 'package:flutter/material.dart';
import 'package:fluctronmusicapp/widget/Customdrawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluctronmusicapp/model/artistsData.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Artists extends StatefulWidget {
  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  Future<List<ArtistData>> _getArtists() async{
    var getArtist = await http.get("http://thehacktivist.tech/api_data/music_dataset.json");
    var getData = json.decode(getArtist.body);
    List<ArtistData> ArtistList = [];
    for (var A in getData['ARTISTS']){
      ArtistData artist = ArtistData(A['name'],A['image_url']);
      ArtistList.add(artist);
    }
    return ArtistList;
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
            backgroundColor: Color(0xffe3c299),
            expandedHeight: 210.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Artists',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    letterSpacing: 2.5,
                  )),
              background: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "https://hdwallsource.com/img/2015/11/guitar-wallpaper-45312-46523-hd-wallpapers.jpg",
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
                future: _getArtists(),
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
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data[index].Artist_url),
                          ),
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
