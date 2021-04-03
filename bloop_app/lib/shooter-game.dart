import 'dart:ui';
import 'package:bloop_app/shooter_game_components/EnemyManager.dart';
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


class ShooterGame extends BaseGame with PanDetector, HasWidgetsOverlay{
  ParallaxComponent _parallaxComponent;
  BloopPlayer _bloop;
  double _elapsedBulletTime = 10;
  bool dragBloop = false;
  Size dimensions;
  EnemyManager _enemyManager;
  Bullet _bullet;

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
    _enemyManager = EnemyManager();
    add(_enemyManager);

    addWidgetOverlay('Hud', _buildHud());
  }

  //timer used to spawn enemies
  double enemyTimer = 0.0;
  @override
  void update(double t) {

    super.update(t);
    playerX = _bloop.x;
    playerY = _bloop.y;

    // bullet spawner
    if (_elapsedBulletTime >= 0.1){
      _bullet = new Bullet();
      addLater(_bullet);
      _elapsedBulletTime = 0;
    }else{
      _elapsedBulletTime += t;
    }

    // collision
    components.whereType<Enemy>().forEach((enemy) {
        if(_bloop.distance(enemy) < 20){
            _bloop.hit();
      }
        components.whereType<Bullet>().forEach((bullet){
          if(bullet.distance(enemy) < 20){
            bullet.gotHit();
          }
        });
    });
  }

  //Displays score text on a canvas
  @override
  void render(Canvas canvas){
    super.render(canvas);
    final textStyle = TextStyle(
        color: Colors.white,
        fontSize: 48
    );
    // TODO: move score to the hub method as an overlay widget
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

  Widget _buildHud(){
    return Positioned(
      bottom: 30.0,
      left: 0.0,
      child:
        IconButton(
          icon: Icon(
              Icons.pause,
              color: Colors.white70,
              size: 60.0),
        onPressed: (){
            pauseGame();
      },
      ),
    );
  }

  void pauseGame(){
    pauseEngine();
    
    addWidgetOverlay('PauseMenu', _buildPauseMenu());
  }

  Widget _buildPauseMenu() {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 50.0,
          ),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children:[
            Text(
                'Paused',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
            IconButton(
                icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 40.0),
                onPressed: (){
                  resumeGame();
                }
                )
            ],
          ),
        ),
      ),
    );
  }

  void resumeGame() {
    removeWidgetOverlay('PauseMenu');
    resumeEngine();
  }
  }