import 'dart:developer';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:marquee/marquee.dart';
import 'package:musicapp/controller/favorite.dart';
import 'package:musicapp/controller/songdetails.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Playp extends StatefulWidget {
  Playp(
      {Key? key,
       this.audioplayer,
       required this.songmodel,
      required this.sindex,
       this.songlength,
       this.id,
      this.songThumb})
      : super(key: key);
  final AudioPlayer? audioplayer;
  final SongModel songmodel;
  final QueryArtworkWidget? songThumb;
  int sindex = 0;
  final songlength;
  final id;

  int c = 1;
  @override
  State<Playp> createState() => _PlaypState();
}

class _PlaypState extends State<Playp> {
  // List<AudioSource>songList = [];
  bool isplay = false;
  bool isrepeat = false;
  bool isshuffle = false;
  bool isFavorite = false;
  int currentindex = 0;
  int c = 0;

  play() {
    try {
      widget.audioplayer!
          .setAudioSource(AudioSource.uri(Uri.parse(widget.songmodel!.uri!)));
      setState(() {
        Property.songDetails = widget.songmodel!.title.toString();
        Property.artistD = widget.songmodel!.artist.toString();
        Property.artistT = widget.songmodel!.id;
      });
      MediaItem(
          id: '${widget.songmodel!.id}',
          title: '${widget.songmodel!.title}',
          artist: '${widget.songmodel!.artist}',
          album: '${widget.songmodel!.album}'
        // artUri: widget.songModel.uri
      );
      widget.audioplayer!.play();
      isplay = true;
    } catch (e) {
      print("Error loading audio source: $e");
      log("Unable to load Audio Source");
    }
    widget.audioplayer!.durationStream.listen((d) {
      setState(() {
        Property.duration = d!;
      });
    });
    widget.audioplayer!.positionStream.listen((p) {
      setState(() {
        Property.position = p!;
      });
    });
  }
  playnext() {
    if (widget.sindex + c <= widget.songlength) {
      c++;
      try {
        widget.audioplayer!.setAudioSource(AudioSource.uri(
            Uri.parse(Property.SongSkip[0][widget.sindex + c].uri!)));
        setState(() {
          Property.songDetails =
              Property.SongSkip[0][widget.sindex + c].title.toString();
          Property.artistD =
              Property.SongSkip[0][widget.sindex + c].artist.toString();
          Property.artistT = Property.SongSkip[0][widget.sindex + c].id;
          Property.image = QueryArtworkWidget(id: widget.id + c, type: ArtworkType.AUDIO);
        });
        MediaItem(
            id: '${Property.SongSkip[0][widget.sindex + c].id}',
            title: '${Property.SongSkip[0][widget.sindex + c].title}',
            artist: '${Property.SongSkip[0][widget.sindex + c].artist}');
            // album: '${widget.songmodel.album}');
        widget.audioplayer!.play();
        isplay = true;
      } catch (e) {
        print("Error loading audio source: $e");
        log("Unable to load Audio Source");
      }
    } else if (widget.sindex + c + 1 <= widget.songlength) {
      final SnackBar _snackBar = SnackBar(
        content: const Text('No more Skippable Songs'),
        duration: const Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    }
  }

  playprevious() {
    c--;
    try {
      widget.audioplayer!.setAudioSource(AudioSource.uri(
          Uri.parse(Property.SongSkip[0][widget.sindex + c].uri!)));
      setState(() {
        Property.songDetails =
            Property.SongSkip[0][widget.sindex + c].title.toString();
        Property.artistD =
            Property.SongSkip[0][widget.sindex + c].artist.toString();
        Property.artistT = Property.SongSkip[0][widget.sindex + c].id;
        Property.image = QueryArtworkWidget(id: widget.id + c, type: ArtworkType.AUDIO);
      });
      MediaItem(
          id: '${Property.SongSkip[0][widget.sindex + c].id}',
          title: '${Property.SongSkip[0][widget.sindex + c].title}',
          artist: '${Property.SongSkip[0][widget.sindex + c].artist}');
          // album: '${widget.songmodel.album}');
      widget.audioplayer!.play();
      isplay = true;
    } catch (e) {
      print("Error loading audio source: $e");
      log("Unable to load Audio Source");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    play();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    widget.audioplayer!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                CupertinoIcons.back,
                color: Colors.white,
                size: 30,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // actions: [
          //   InkWell(
          //     onTap: () {
          //       PopupMenuButton(
          //         itemBuilder: (context) {
          //           return [
          //             PopupMenuItem<int>(
          //                 value: 0,
          //                 child: Row(
          //                   children: [
          //                     // Icon(Icons.playlist_add),
          //                     Text("Add to playlist"),
          //                   ],
          //                 )),
          //           ];
          //         },
          //         // onSelected: (value){
          //         //   if(value == 0){
          //         //     print("add");
          //         //   }
          //         // },
          //       );
          //     },
          //     child: Icon(
          //       Icons.more_vert,
          //       color: Colors.white,
          //       size: 30,
          //     ),
          //   )
          // ],
        ),
        extendBodyBehindAppBar: true,
        body: Stack(fit: StackFit.expand, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Property.image,),
            ],
          ),
          BlurryContainer(
              height: MediaQuery.of(context).size.height,
              blur: 60,
              child: Container(
                height: MediaQuery.of(context).size.height,
              )),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 160,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width / 1.1,
                child:  Property.image
              )
            ],
          )),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 541,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Marquee(
                          text: " ${Property.songDetails.toString()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 20,
                          velocity: 100,
                          pauseAfterRound: Duration(seconds: 2),
                          showFadingOnlyWhenScrolling: false,
                          fadingEdgeStartFraction: 0.1,
                          fadingEdgeEndFraction: 0.1,
                          startPadding: 10,
                          accelerationDuration: Duration(seconds: 1),
                          accelerationCurve: Curves.linear,
                          decelerationDuration: Duration(milliseconds: 1000),
                          decelerationCurve: Curves.easeOut,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                    Container(
                      height: 30,
                      width: 120,
                      child: Text(Property.artistD.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 8,
                    ),
                    InkWell(
                      onTap: () {
                        Property.favsongs!.add(Property.SongSkip);
                        print("===========================================${Property.favsongs}");
                        setState(() {
                          if (Property.favsongname.contains(Property.SongSkip[currentindex][widget.sindex].title)) {
                            Property.favsongs.remove(Property.SongSkip[currentindex][widget.sindex]);
                           Property.favsongname.remove(Property.SongSkip[currentindex][widget.sindex].title);
                           Property.favartistname
                               .remove(Property.SongSkip[currentindex][widget.sindex].artist);
                           Property.favimage.remove(Property.image);
                          }
                          if (isFavorite == false) {
                            isFavorite = true;
                            // Property.favsongs.add(Property.SongSkip);
                            Property.favsongname
                                .add(Property.SongSkip[currentindex][widget.sindex].title);
                            Property.favartistname
                                .add(Property.SongSkip[currentindex][widget.sindex].artist);
                            Property.favimage.add(Property.image);
                          } else {
                            isFavorite = false;
                          }
                        });
                      },
                      child: Container(
                          child: isFavorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 35,
                                )
                              : Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                  size: 35,
                                )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        Property.position.toString().split(".")[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                        child: Slider(
                      activeColor: Colors.indigo,
                      inactiveColor: Colors.white,
                      min: Duration(microseconds: 0).inSeconds.toDouble(),
                      max: Property.duration.inSeconds.toDouble(),
                      value: Property.position.inSeconds.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          changetosec(value.toInt());
                          value = value;
                        });
                      },
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        Property.duration.toString().split(".")[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            playprevious();
                          });
                              },
                        icon: Icon(
                          Icons.repeat,
                          color: Colors.white,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (widget.sindex != 0) {
                              playprevious();
                            }
                          });
                        },
                        icon: Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 30,
                        )),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (isplay) {
                            print("aaaaa....");
                            widget.audioplayer!.pause();
                          } else {
                            print("bbbbb.............");
                            widget.audioplayer!.play();
                          }
                          isplay = !isplay;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Icon(
                            isplay ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.indigo,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 8.0,
                            )
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if(widget.sindex + c <=
                              Property.SongSkip[0].length){
                            playnext();
                          }
                        },
                        icon: Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 30,
                        )),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (isshuffle == false) {
                            isshuffle = true;
                            onShuffleButtonPressed();
                          } else {
                            isshuffle = false;
                          }
                        });
                      },
                      child: Container(
                        child: Icon(
                          Icons.shuffle,
                          color: isshuffle ? Colors.indigo : Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
        ])
    ])
    );
  }

  void onShuffleButtonPressed() async {
    final enable = !widget.audioplayer!.shuffleModeEnabled;
    if (enable) {
      await widget.audioplayer!.shuffle();
    }
    await widget.audioplayer!.setShuffleModeEnabled(enable);
  }

  void changetosec(int seconds) {
    Duration _duration = Duration(seconds: seconds);
    widget.audioplayer!.seek(_duration);
  }
}
