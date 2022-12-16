import 'package:flutter/material.dart';

class Newdrawer extends StatelessWidget {
  const Newdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Row(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Welcome name",style: TextStyle(
                fontSize: 25,
                color: Colors.white
              ),),
            ],
          ),decoration: BoxDecoration(
            color: Colors.indigo
          ),),
          ListTile(
            title: Text("Dark mode", style: TextStyle(
              color: Colors.indigo,
            ),),
          ),
        ],
      ),
    );
  }
}
