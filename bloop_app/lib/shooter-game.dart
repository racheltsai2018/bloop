import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:bloop_app/shooter_game_components/character.dart';
import 'package:flame/flame.dart';


class ShooterGame extends Game {
  Size screenSize;
  double tileSize;
  bool isOn = false;
  Character character;
  bool dragPlayer = false;

  ShooterGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions()); //wait for Flame to send the size of the screen
    character = Character(this, 50, 50);

  }

  //same as draw class, simply rendering all the objects in the game
  void render(Canvas canvas) {
    //Set Backgound to be black rectangle
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff060326);
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

    //forEach is like a for loop for all component of the list
    //forEach requires a function as a varaiable => just shortens it
    //flies.forEach((Fly fly) => fly.render(canvas));
    character.render(canvas);
  }

  //updates objects 60 frames per second
  void update(double t) {
    //forEach is like a for loop for all component of the list
    //forEach requires a function as a varaiable => just shortens it
    //flies.forEach((Fly fly) => fly.update(t));
    character.update(t);
  }

  //Overwriting original resize function from Game
  void resize(Size size) {
    super.resize(size);
    screenSize = size;
    tileSize = screenSize.width / 9;
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

  void onPanStart(DragStartDetails details) {
    double x = details.globalPosition.dx;
    double y = details.globalPosition.dy;
    if (x >= character.characterRect.left - tileSize
        && x <= character.characterRect.left + tileSize
        && y >= character.characterRect.top - tileSize
        && y <= character.characterRect.top + tileSize
    ) {
      dragPlayer = true;
    }
  }
 void onPanEnd(DragEndDetails details){
      dragPlayer = false;
 }


  void onPanUpdate(DragUpdateDetails details){
    final delta = details.delta;
    double translateX = delta.dx;
    double translateY = delta.dy;
    if(dragPlayer) {
      // Make sure that the player never goes outside of the screen in the X-axis
      if (character.characterRect.right + delta.dx >= screenSize.width) {
        translateX = screenSize.width - character.characterRect.right;
      } else if (character.characterRect.left + delta.dx <= 0) {
        translateX = -character.characterRect.left;
      }
      // Make sure that the player never goes outside of the screen in the Y-axis
      if (character.characterRect.bottom + delta.dy >= screenSize.height) {
        translateY = screenSize.height - character.characterRect.bottom;
      } else if (character.characterRect.top + delta.dy <= 0) {
        translateY = -character.characterRect.top;
      }
      character.characterRect =
          character.characterRect.translate(translateX, translateY);
    }
  }
}