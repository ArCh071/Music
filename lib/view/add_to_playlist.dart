// import 'package:flutter/material.dart';
// import 'package:musicapp/controller/songdetails.dart';
// import 'package:on_audio_query/on_audio_query.dart';
//
// import 'music_view.dart';
//
// class Addplaylist extends StatefulWidget {
//   const Addplaylist({Key? key}) : super(key: key);
//
//   @override
//   State<Addplaylist> createState() => _AddplaylistState();
// }
//
// class _AddplaylistState extends State<Addplaylist> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Column(
//         children: [
//       Expanded(
//         child: ListView.builder(
//         itemCount: Property.SongSkip.length,
//             itemBuilder: (context, index) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: height/70,
//                       ),
//                       InkWell(
//                         child: Container(
//                           height: height/13,
//                           width: width/1.07,
//                           decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.indigo,
//                                   blurRadius: 8.0,
//                                 )
//                               ],
//                               color: Colors.lightBlue[900],
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(
//                                 color: Colors.indigo,
//                               )),
//                           child: Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                 const EdgeInsets.only(left: 2),
//                                 child: Container(
//                                     height: height/18,
//                                     width: width/8,
//                                     // child: QueryArtworkWidget(
//                                     //   id: Property.SongSkip[index].id,
//                                     //   type: ArtworkType.AUDIO,
//                                     // )
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width/60,
//                               ),
//                               Column(
//                                 children: [
//                                   SizedBox(
//                                     height: height/60,
//                                   ),
//                                   Container(
//                                     height: height/40,
//                                     width: width/1.5,
//                                     child: Text(
//                                       "${Property.SongSkip[index].title}",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: height/280,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 110),
//                                     child: Container(
//                                       height: height/60,
//                                       width: width/2.7,
//                                       child: Text(
//                                         "${Property.SongSkip[index]}",
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             }),
//       )
//         ],
//       ),
//     );
//   }
// }
