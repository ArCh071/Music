import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab_bar extends StatelessWidget {
  const Tab_bar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
          isScrollable: false,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 18),
          indicator: BoxDecoration(
              border: Border(bottom: BorderSide(
                width: 2,color: Colors.lightBlue[900]!
                // color: Colors.blueGrey,
              ))
          ),
          tabs: [
            Tab(
              text: "Musics",
            ),
            Tab(
              text: "Playlists",
            ),
            Tab(
              text: "Favorites",
            ),
          ],
        );
  }
}
