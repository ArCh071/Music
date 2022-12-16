import 'package:flutter/material.dart';
import 'package:musicapp/controller/playlist.dart';
import 'package:musicapp/controller/songdetails.dart';
import 'package:musicapp/view/music_view.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Playlistv extends StatefulWidget {
   Playlistv({Key? key, required this.playlistindex}) : super(key: key);
  int playlistindex = 0;
  @override
  State<Playlistv> createState() => _PlaylistvState();
}

class _PlaylistvState extends State<Playlistv> {
  bool isplay = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFE1F5FE),
        Colors.lightBlue,],
    )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
    appBar: AppBar(
    backgroundColor: Colors.transparent,elevation: 0,
    leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new, color: Colors.blueGrey,)),
    title:
    Text(Property.playlist![widget.playlistindex], style: TextStyle(
    color: Colors.blueGrey, fontWeight: FontWeight.bold, overflow: TextOverflow.fade
    ),),
    actions: [
    Icon(Icons. more_vert_rounded, color: Colors.blueGrey,)
    ],
    ),
    body:Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [SizedBox(
        height: 10,
      ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [Container(
              height: 280,
              width: 320,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo,
                    blurRadius: 8.0,
                  )
                ],
                borderRadius: BorderRadius.circular(40),

              ),

          child: QueryArtworkWidget(
            id: Playlists.id, type: ArtworkType.AUDIO,
            quality: 100,
            artworkQuality: FilterQuality.high,),
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
              ),
              child: Icon(Icons.play_arrow_outlined, color: Colors.white,
              size: 35,),
            )
        ]),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: Playlists.songs.length,
              itemBuilder: (context,index) {
                Playlists.length = Playlists.songs.length;
                print(Playlists.id);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Playp(songmodel: Playlists.songs[index], sindex: index),));
                        },
                        child: Container(
                          width: 370,
                          height: 70,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.indigo,
                                  blurRadius: 8.0,
                                )
                              ],
                              color: Colors.lightBlue[900],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.indigo,
                              )
                          ),
                          child:
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  height: 55,
                                  width: 55,
                              child: Playlists.image[index]
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 200,
                                      child: Text(Playlists.songname[index]
                                        // Playlists.songname[Playlists.id]
                                        ,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 110),
                                      child: Container(
                                        height: 15,
                                        width: 120,
                                        child: Text(Playlists.artist[index]
                                          // Playlists.artist[Playlists.id]
                                          ,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(30),
                                ),
                                child: InkWell(

                                    child: isplay?Icon(Icons.pause_circle, size: 30, color: Color(0xFF000633),):Icon(Icons.play_arrow_outlined, size: 30, color: Color(0xFF000633),)),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
          ),
        )
      ],
    )
    )
    );
  }
}
