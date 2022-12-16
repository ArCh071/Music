
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:musicapp/view/homescreen.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    notificationColor: Colors.indigo,
    androidNotificationChannelId: 'playing',
    androidStopForegroundOnPause: true,
    androidResumeOnClick: true,
    preloadArtwork: true,
    artDownscaleHeight: 30,
    artDownscaleWidth: 30,
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: false,
  );
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('downloads');
  await Hive.openBox('favorite songs');
  await Hive.openBox('cache');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screenp(),
    );
  }
}
