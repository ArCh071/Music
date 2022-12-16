import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/view/drawer.dart';
import 'package:musicapp/view/favoritess.dart';
import 'package:musicapp/view/musics.dart';
import 'package:musicapp/view/playlist_create.dart';
import '../widgets/TabBar.dart';

class Screenp extends StatefulWidget {
  const Screenp({Key? key}) : super(key: key);
  @override
  State<Screenp> createState() => _ScreenpState();
}

class _ScreenpState extends State<Screenp>{
  AudioPlayer audioPlayer =AudioPlayer();
  bool isplay = false;
  bool searching = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                   colors: [Colors.indigo,
                     Colors.cyan,],
              )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: Newdrawer(),
            // bottomNavigationBar: miniplayer(),
            appBar: AppBar(backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white,size: 30),
            // actions: [IconButton(onPressed: (){
            //   showSearch(context: context, delegate: Mysearch(),);
            // }, icon: Icon(Icons.search_rounded))],
              ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Container(
                      height: 30,
                      child: Text(
                        "Hi ,",
                        style: GoogleFonts.patrickHand(
                            color: Colors.white, fontSize: 29),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     InkWell(
                  //       onTap: (){
                  //         if(searching){
                  //           FocusScope.of(context).requestFocus(FocusNode());
                  //           search.text = "";
                  //           filtered.clear();
                  //         }
                  //         searching = !searching;
                  //         setState(() {
                  //
                  //         });
                  //       },
                  //       child: Container(
                  //         height: 50,
                  //         width: 360,
                  //         child: TextField(
                  //           decoration: InputDecoration(
                  //             labelText: "Search music",
                  //               suffixIcon: Icon(searching? Icons.close_rounded:Icons.search_rounded,
                  //               color: Colors.white,),
                  //               border: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(20))),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Expanded(
                    child: Column(
                      children: [
                        Tab_bar(),
                        Flexible(
                            child: TabBarView(
                          children: [
                            Musicp(),
                           Playlistp(),
                            Favp()
                          ],
                        )),
                      ],
                    ),
                  ),

                ],
              ),
            ),),
    );
  }
//   miniplayer(){
//     if(Property.image == null){
//       return SizedBox();
//     }return
//     InkWell(
//         onTap: () {
//           // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Playp(index: Property.index, audioplayer: audioPlayer, songmodel: null,),));
//           //
//           },
//         child: Container(
//           height: 60,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.white)
//           ),
//           child: Row(
//             children: [
//               Container(
//                 height: 50,
//                 width: 50,
//                 child: Property.image,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 25,
//                     width: 220,
//                     child: Text(
//                       Property.songname!, style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,color: Colors.white,
//                         overflow: TextOverflow.fade
//                     ),),
//                   ),
//                   Container(
//                     height: 15,
//                     width: 200,
//                     child: Text(Property.artistname!,style: TextStyle(
//                         color: Colors.white
//                     ),),
//                   )
//                 ],
//               ),
//                InkWell(
//                  onTap: (){
//                    if(Property.index !=0){
//
//                    }
//                  },
//                  child: Container(
//                    child: Icon(Icons.skip_previous,color: Colors.black,size: 35,)),
//                ),
//               SizedBox(
//                 width: 5,
//               ),
//
//               InkWell(
//                 onTap: () {
//                   if (isplay) {
//                     setState(() {
//                       print("aaaaa....");
//                       Property.audioplayer.pause();
//                     });
//                   } else {
//                     setState(() {
//                       print("bbbbb.............");
//                       Property.audioplayer.play();
//                     });
//                   }
//                   isplay = !isplay;
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.white,
//                     width: 2),
//                   ),
//                   height: 35,
//                   width: 35,
//                   child: Center(
//                     child: Icon(
//                       isplay? Icons.pause : Icons.play_arrow,
//                       color: Colors.white,
//                       size: 28,
//                     ),
//                   ),),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//              Container(
//                child: Icon(Icons.skip_next, color: Colors.black,size: 35,),
//              )
//             ],
//           ),
//         )
//     );
//   }
}

// class Mysearch extends SearchDelegate{
//   @override
//   Widget? buildLeading(BuildContext context) =>
//       IconButton(onPressed: () => close(context, null), icon: Icon(Icons.arrow_back_ios));
//   @override
//   List<Widget>? buildActions(BuildContext context) => [
//     IconButton(onPressed: (){
//       if(query.isEmpty){
//         close(context, null);
//       }else{
//         query='';
//       }
//     }, icon: Icon(Icons.clear))];
//
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return FutureBuilder<List<SongModel>>(
//         future: Property.audio.querySongs(
//             sortType: SongSortType.DISPLAY_NAME,
//             uriType: UriType.EXTERNAL,
//             ignoreCase: true),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (!snapshot.hasData) {
//             return Text("no songs");
//           }
//           return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 QueryArtworkWidget id=QueryArtworkWidget(
//                   id: snapshot.data![index].id,
//                   type: ArtworkType.AUDIO,
//                 );
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             // context.read<Song_provider>()
//                             //     .setid(snapshot.data![index].id);
//                             Property.artistname = snapshot.data![index].artist?? "No artist";
//                             Property.songname = snapshot.data![index].title;
//                             Property.image = id;
//                             Property.data = snapshot.data!;
//                             Property.songs = Property.audioplayer;
//                             Property.index = index;
//                             Property.tilesong = true;
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => Playp(),
//                                 ));
//                           },
//                           child: Container(
//                             height: 65,
//                             width: 360,
//                             decoration: BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.indigo,
//                                     blurRadius: 8.0,
//                                   )
//                                 ],
//                                 color: Colors.lightBlue[900],
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                   color: Colors.indigo,
//                                 )),
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding:
//                                   const EdgeInsets.only(left: 2),
//                                   child: Container(
//                                       height: 55,
//                                       width: 55,
//                                       child: id),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 14,
//                                     ),
//                                     Container(
//                                       height: 20,
//                                       width: 240,
//                                       child: Text(
//                                         "${snapshot.data![index].title}",
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 3,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           right: 110),
//                                       child: Container(
//                                         height: 15,
//                                         width: 120,
//                                         child: Text(
//                                           "${snapshot.data![index].artist}",
//                                           style: TextStyle(
//                                               fontSize: 12,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   width: 20,
//                                 ),
//                                 Container(
//                                   child: Icon(
//                                     Icons.more_vert_rounded,
//                                     size: 25,
//                                     color: Colors.white,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               });
//         });
//
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestions = ["${Property.songname![Property.index]}",
//       "${Property.songname![Property.index]}", "${Property.songname![Property.index]}",
//       "${Property.songname![Property.index]}" ];
//     return ListView.builder(
//       itemCount: suggestions.length,
//         itemBuilder: (context, index){
//         final suggestion = suggestions[index];
//         return ListTile(
//           title: Text(suggestion),
//           onTap: (){
//             query = suggestion;
//             showResults(context);
//           },
//         );
//         });
//   }
//
//
// }

