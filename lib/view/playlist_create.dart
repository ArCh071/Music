import 'package:flutter/material.dart';
import 'package:musicapp/controller/playlist.dart';
import 'package:musicapp/controller/songdetails.dart';
import 'package:musicapp/view/add_to_playlist.dart';
import 'package:musicapp/view/musics.dart';
import 'package:musicapp/view/playlist_view.dart';

class Playlistp extends StatefulWidget {
  const Playlistp({Key? key}) : super(key: key);

  @override
  State<Playlistp> createState() => _PlaylistpState();
}

class _PlaylistpState extends State<Playlistp> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
                  Center(
                    child: InkWell(
                      onTap: () async{
                       final name = await openbox();
                       if(name == null || name.isEmpty) return;
                       setState(()=>
                         Property.namee = name,
                       );
                       Property.playlist.add(Property.namee);
                       print(Property.playlist.length);
                      },
                      child: Container(
                        height: 40,
                        width: 370,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 7,
                              color: Colors.black
                            )
                          ]
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.playlist_add,
                            color: Colors.white,),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Create Playlist", style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
              SizedBox(
                height: 10,
              ),
              Expanded(
              child: ListView.builder(
                  itemCount: Property.playlist.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                Playlistv(playlistindex : index),));
                          },
                          child: Container(
                            margin:
                            EdgeInsets.only(top: 15, right: 12, left: 15),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            height: MediaQuery.of(context).size.height/13,
                            width: MediaQuery.of(context).size.width/1.07,
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
                              children: [
                                Icon(
                                  Icons.folder_copy_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        Property.playlist[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: 200,
                                        child:
                                        Text(
                                          "${Playlists.length} songs",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color:
                                            Colors.white.withOpacity(0.8),
                                            fontSize: 14,
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 5,
                                ),
                                IconButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Musicp(),));
                                }, icon: Icon(Icons.add_circle, color: Colors.white,
                                size: 25,)),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: InkWell(
                                      onTap: ()  {
                                        setState(() {
                                         Property.playlist.removeAt(index);
                                        });
                                      },
                                      child: InkWell(
                                        child: Icon(
                                          Icons.delete,
                                          size: 25,
                                          color: Colors.red,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
              ),
            ],
          ),
    )
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
    Property.playlistname.clear();
  }

}
