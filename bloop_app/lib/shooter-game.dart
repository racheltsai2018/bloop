import 'dart:ui';
import 'package:bloop_app/shooter_game_components/bullet.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:bloop_app/shooter_game_components/bloopPlayer.dart';
import 'package:flame/flame.dart';
import 'package:bloop_app/shooter_game_components/enemy.dart';
import 'package:flutter/material.dart';

double playerX;
double playerY;
Enemy enemy;

class ShooterGame extends BaseGame with PanDetector{
  ParallaxComponent _parallaxComponent;
  BloopPlayer _bloop;
  double _elapsedBulletTime = 10;
  bool dragBloop = false;
  Size dimensions;

  ShooterGame(){
    _parallaxComponent = ParallaxComponent([
      ParallaxImage("space_1.png", alignment: Alignment.center,repeat: ImageRepeat.repeatY, fill: LayerFill.width),
      ParallaxImage("space_2.png", alignment: Alignment.center, repeat: ImageRepeat.repeatY, fill: LayerFill.width),
    ],
      baseSpeed: Offset(0,-100),
      layerDelta: Offset(0, -20),
    );
    add(_parallaxComponent);
    _bloop = BloopPlayer();
    playerX = _bloop.x;
    playerY = _bloop.y;
    add(_bloop);
  }

  //timer used to spawn enemies
  double enemyTimer = 0.0;
  @override
  void update(double t) {
    // TODO: implement update

    //enemy generator
    enemyTimer += t;
    if(enemyTimer >= 4){
      enemyTimer = 0.0;
      enemy = new Enemy(dimensions);
      add(enemy);
    }

    super.update(t);
    playerX = _bloop.x;
    playerY = _bloop.y;

    //bullet spawner
    if (_elapsedBulletTime >= 0.1){
      Bullet bullet = new Bullet();
      add(bullet);
      _elapsedBulletTime = 0;
    }else{
      _elapsedBulletTime += t;
    }
  }

  //Displays score text on a canvas
  @override
  void render(Canvas canvas){
    super.render(canvas);
    final textStyle = TextStyle(
        color: Colors.white,
        fontSize: 48
    );
    final textSpan = TextSpan(
        text: "Score: 0",
        style: textStyle
    );
    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr
    );
    textPainter.layout(
        minWidth: 0,
        maxWidth: size.width
    );
    textPainter.paint(canvas, Offset(size.width/ 4.5, size.height - 50));
  }

  //Pan is use for dragging the player

  //Pan start called when there will be a potential drag, makes sure the character was grabbed
  @override
  void onPanStart(DragStartDetails details) {
    super.onPanStart(details);
    double x = details.globalPosition.dx;
    double y = details.globalPosition.dy;
    dragBloop = _bloop.isInside(x, y);
  }

  //finger lifted no more drag
  @override
  void onPanEnd(DragEndDetails details) {
    super.onPanEnd(details);
    dragBloop = false;
  }

  //when dragging happens and the character is grabbed, update location of player
  @override
  void onPanUpdate(DragUpdateDetails details) {
    super.onPanUpdate(details);
    final delta = details.delta;
    double translateX = delta.dx;
    double translateY = delta.dy;

    if(dragBloop) {
      translateX = _bloop.insideX(translateX); //makes sure x coordinates are inside the screen
      translateY = _bloop.insideY(translateY); //makes sure x coordinates are inside the screen
      _bloop.translateBloop(translateX, translateY);
    }
  }
  /*
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
    character = Character();

  }

  //same as draw class, simply rendering all the objects in the game
  void render(Canvas canvas) {
    super.render(canvas);
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
    super.update(t);
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
  }*/
}