import 'package:bloop_app/about.dart';
import 'package:bloop_app/credits.dart';
import 'package:bloop_app/team.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:bloop_app/homepage.dart';
import 'package:bloop_app/meditation.dart';
import 'package:flutter/material.dart';

class setting extends StatefulWidget {
   _settingState createState() => _settingState();
}
class _settingState extends State<setting>{
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting',
            style: GoogleFonts.fascinate(color: Colors.black, fontSize: 25.0)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[100],
        elevation: 30.0,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.indigo[900],
                Colors.blue[900],
                Colors.blue,
                Colors.white
              ])),
          child: SettingsList(
            sections: [
              SettingsSection(
                title: 'App',
                tiles: [
                  SettingsTile(
                    title: 'About',
                    leading: Icon(Icons.auto_awesome),
                    onPressed: (BuildContext context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => about()),
                      );
                    },
                  ),
                  SettingsTile(
                    title: 'Team',
                    leading: Icon(Icons.emoji_objects_outlined),
                    onPressed: (BuildContext context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => team()),
                      );
                    },
                  ),
                  SettingsTile(
                    title: 'Credits',
                    leading: Icon(Icons.auto_stories),
                    onPressed: (BuildContext context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => credits()),
                      );
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: 'General',
                tiles: [
                  SettingsTile(
                    title: 'Language',
                    subtitle: 'English',
                    leading: Icon(Icons.language),
                    onPressed: (BuildContext context) {
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Notice"),
                          content: Text("Currently Only Support English."),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
