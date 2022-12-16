import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
class Property{
  static List addplaylist = [];
  static String namee = '';
  static List<dynamic> playlist = [];
  static TextEditingController playlistname = TextEditingController();
  static List SongSkip = [];
  static List artistL = [];
  static String? songDetails;
  static String? artistD;
  static var artistT;
  static String? artwork;
  static String? songname = '';
  static String? artistname = '';
  static var id = 0;
  static QueryArtworkWidget? image;
  static dynamic favsongs = []; //=============================================================================
  static dynamic favsongname = [];
  static dynamic favartistname = [];
  static dynamic favimage = [];
  // static AudioPlayer audioplayer = AudioPlayer();
  static dynamic songindex ;
  static dynamic data = [];
  static Duration duration = Duration();
  static Duration position = Duration();
  // static int favindex = 0;


}