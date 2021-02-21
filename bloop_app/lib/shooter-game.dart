import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';

class ShooterGame extends Game {
  Size screenSize;
  bool isOn = false;

  //same as draw class, simply rendering all the objects in the game
  void render(Canvas canvas) {
    //Set Backgound to be black rectangle
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    //target box
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
        screenCenterX - 75,
        screenCenterY - 75,
        150,
        150
    );
    Paint boxPaint = Paint();
    if (isOn) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);

  }

  //updates objects 60 frames per second
  void update(double t) {
    // TODO: implement update
  }

  //Overwriting original resize function from Game
  void resize(Size size) {
    super.resize(size);
    screenSize = size;
  }

  void onTapDown(TapDownDetails d) {
    // handle taps here

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75
        && d.globalPosition.dx <= screenCenterX + 75
        && d.globalPosition.dy >= screenCenterY - 75
        && d.globalPosition.dy <= screenCenterY + 75
    ) {
      isOn = !isOn;
    }
  }
}