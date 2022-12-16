import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:musicapp/controller/favorite.dart';
import 'package:musicapp/controller/songdetails.dart';
import 'package:musicapp/view/music_view.dart';

class Favp extends StatefulWidget {
  const Favp({Key? key}) : super(key: key);

  @override
  State<Favp> createState() => _FavpState();
}

class _FavpState extends State<Favp> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool favplay = false;
  bool isplay = false;
  bool isfav = false;
  var selected_index;
  int _currentIndex = 0;
  bool _unSelectedIndex = false;
  final AudioPlayer audioplayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              child: ListView.builder(
                  itemCount: Property.favartistname.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Playp(
                                          sindex: index, songmodel: Property.favsongs[index]),
                                    ));
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
                                      )),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        height: 55,
                                        width: 55,
                                        child: Property.favimage[index]),
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
                                            child: Text(
                                              Property.favsongname[index],
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
                                              child: Text(
                                                Property.favartistname[index],
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
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Property.favsongname
                                                .removeAt(index);
                                            Property.favartistname
                                                .removeAt(index);
                                            Property.favimage.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                            width: 30,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 30,
                                            ))),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (isplay) {
                                            setState(() {
                                              // play();
                                            });
                                          } else {
                                            print("bbbbb.............");
                                          }
                                          isplay = !isplay;
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                          child: Icon(
                                            isplay
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ])))
                        ],
                      ),
                    );
                  }))),
    );
  }

  // play() {
  //   try {
  //     audioplayer!.setAudioSource(AudioSource.uri(
  //         Uri.parse(Property.favsongs[_currentIndex].uri!)));
  //     setState(() {
  //       favorite.favsongDetails =
  //           favorite.favsongs[_currentIndex].title.toString();
  //       favorite.favartistD =
  //           favorite.favsongs[_currentIndex].artist.toString();
  //       favorite.favartistT = Property.favsongs[_currentIndex].id;
  //     });
  //     MediaItem(
  //       id: '${Property.favsongs[_currentIndex].id}',
  //       album: "${Property.favsongs[_currentIndex].album}",
  //       title: "${Property.favsongs[_currentIndex].title}",
  //       artist: '${Property.favsongs[_currentIndex].artist}',
  //       // artUri: Uri.parse("${Property.image}"),
  //     );
  //     audioplayer!.play();
  //     isplay = true;
  //   } on Exception catch (e) {
  //     return Text("Error loading audio source: $e");
  //   }
  //   audioplayer!.durationStream.listen((d) {
  //     setState(() {
  //       Property.duration = d!;
  //     });
  //   });
  //   audioplayer!.positionStream.listen((p) {
  //     setState(() {
  //       Property.position = p!;
  //     });
  //   });
  // }
}
