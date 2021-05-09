import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:bloop_app/shooter-game.dart';
import 'package:flutter/gestures.dart';
import 'package:bloop_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
    title: 'bloop',
    home: homepage(),
  ));
}
