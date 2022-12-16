import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/controller/favorite.dart';
import 'package:musicapp/controller/playlist.dart';
import 'package:musicapp/controller/songdetails.dart';
import 'package:musicapp/view/music_view.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class Musicp extends StatefulWidget {
  const Musicp({Key? key}) : super(key: key);
//music app
  @override
  State<Musicp> createState() => _SongpState();
}
class _SongpState extends State<Musicp> {
  int total = 0;
  int selected = 0;
  // List<SongModel> allsongs =[];
  TextEditingController playlistname = TextEditingController();
  static AudioPlayer audioPlayer = AudioPlayer();
  static final audio = OnAudioQuery();

  storageper()async{
    var data = await Permission.storage.request();
    if(data.isGranted){
     Future.delayed(Duration(milliseconds: 500)).then((value) {
       setState(() {

       });
     });
    }
    else{
      var data = await Permission.storage.request();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    storageper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<SongModel>>(
                future:audio.querySongs(
                    sortType: SongSortType.DATE_ADDED,
                    uriType: UriType.EXTERNAL,
                    path: 'Music',
                    ignoreCase: true),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Text("no songs");
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        QueryArtworkWidget id = QueryArtworkWidget(id: snapshot.data![index].id, type: ArtworkType.AUDIO);
                       //  total = snapshot.data!.length;
                       // allsongs.addAll(snapshot.data!);
                       Property.SongSkip.add(snapshot.data);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                 height: height/70,
                                ),
                                InkWell(onLongPress: (){
                                  Playlists.songs.add(snapshot.data);
                                  // print("aaaaaaaa......${Playlists.songs}");
                                  if(snapshot.data![index] == Playlists.songs[selected][index]){
                                    Playlists.songname.add(snapshot.data![index].title);
                                    Playlists.artist.add(snapshot.data![index].artist);
                                    Playlists.id = snapshot.data![index].id;
                                    Playlists.image.add(id);
                                    print("........................${Playlists.songname}");
                                    print(Playlists.id);

                                  }

                                },
                                  onTap: () {
                                     Property.image = QueryArtworkWidget(
                                         id: snapshot.data![index].id, type: ArtworkType.AUDIO,
                                       quality: 100,
                                       artworkQuality: FilterQuality.high,);
                                     Property.songindex = index;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Playp(songmodel : snapshot.data![index],
                                            audioplayer : audioPlayer, sindex : index, songlength : snapshot.data!.length,
                                            id: snapshot.data![index].id
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    height: height/13,
                                    width: width/1.07,
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
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 2),
                                          child: Container(
                                              height: height/18,
                                              width: width/8,
                                           child: QueryArtworkWidget(
                                             id: snapshot.data![index].id,
                                             type: ArtworkType.AUDIO,
                                           )),
                                        ),
                                        SizedBox(
                                          width: width/60,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: height/60,
                                            ),
                                            Container(
                                              height: height/40,
                                              width: width/1.5,
                                              child: Text(
                                                "${snapshot.data![index].title}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height/280,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 110),
                                              child: Container(
                                                height: height/60,
                                                width: width/2.7,
                                                child: Text(
                                                  "${snapshot.data![index].artist}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 35,
                                            child: PopupMenuButton(
                                              onSelected: (value){
                                               if(value == 0){
                                                 box();
                                                 Property.addplaylist.add(snapshot.data![index].title);
                                               }
                                              },
                                            shape:
                                            RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)),
                                              itemBuilder: (context) =>[
                                                PopupMenuItem(value: 0,
                                                    child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.playlist_add,
                                                      size: 20,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Add to playlist", style: TextStyle(
                                                      fontSize: 13
                                                    ),), Divider()
                                                  ],
                                                )),
                                                PopupMenuItem(value: 1,
                                                    child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.timer_outlined,
                                                      size: 20,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Sleep Time", style: TextStyle(
                                                        fontSize: 13
                                                    ),), Divider()
                                                  ],
                                                )),
                                                PopupMenuItem(value: 2,
                                                    child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.info,
                                                      size: 20,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Song Info", style: TextStyle(
                                                        fontSize: 13
                                                    ),),
                                                  ],
                                                ))
                                              ],
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
  box(){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        context:context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.lightBlue,
              Colors.cyanAccent,],
          )
        ),
        height: 200,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: (){
                  openbox();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo,
                        blurRadius: 8.0,
                      )
                    ],
                  ),
                  child :
                      InkWell(
                        onTap: () async{
                          final name = await openbox();
                          Property.playlistname.clear();
                          if(name == null || name.isEmpty) return;
                          setState(()=>
                          Property.namee = name,
                          );
                          Property.playlist.add(Property.namee);
                          print(Property.playlist.length);
                        },
                        child: Container(
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.add_circle, color: Colors.white,),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Create playlist", style: TextStyle(
                                  color: Colors.white
                              ),),
                            ],
                          ),
                        ),
                      ),
                )
              )
            ),
            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                    childAspectRatio: 3,
                  ),
                    itemCount: Property.playlist.length,
                    itemBuilder: (context, index) {
                      return Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                             width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Property.playlist[index].add(Property.addplaylist);
                                print(Property.addplaylist[index].title);
                                print(Property.playlist[index]);
                              },
                              child: Container(
                                height: 50,
                                width: 170,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.indigo,
                                        blurRadius: 8.0,
                                      )],
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(10), border: Border.all(
                                  color: Colors.indigo,
                                )),child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon( Icons.folder_copy_outlined,
                                    color: Colors.white,
                                  ), SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          Property.playlist[index],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),SizedBox(
                                          width: 100,
                                          child:
                                          Text(
                                            "Songs",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color:
                                              Colors.white.withOpacity(0.8),
                                              fontSize: 12,
                                            ),
                                          )),
                                    ],),
                                ],),
                              ),
                            ),
                          ]);
                    }, )
            )
          ])
      );
    }
    );
  }

  Future<String?> openbox() => showDialog<String>(
      context: context, builder: (context) => AlertDialog(
    title: Text("Create new playlist"),
    content: TextField(
      autofocus: true,
      controller: Property.playlistname,
      decoration: InputDecoration(
          hintText: 'playlist name',
          border: UnderlineInputBorder()
      ),
    ),
    actions: [
      Row(
        children: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("cancel")),
          TextButton(onPressed: (){
            create();
          }, child: Text("Create")),
        ],
      )
    ],
  ));
  create(){
    Navigator.of(context).pop(Property.playlistname.text);
    Property.playlist.clear();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }
  }
