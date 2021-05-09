import 'dart:ui';
import 'package:bloop_app/shooter_game_components/EnemyManager.dart';
import 'package:bloop_app/shooter_game_components/bullet.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:bloop_app/shooter_game_components/bloopPlayer.dart';
import 'package:flame/flame.dart';
import 'package:bloop_app/shooter_game_components/enemy.dart';
import 'package:flutter/material.dart';
import 'package:flame/text_config.dart';

import 'shooter_game_components/enemy.dart';

double playerX;
double playerY;


class ShooterGame extends BaseGame with PanDetector, HasWidgetsOverlay{
  ParallaxComponent _parallaxComponent;
  BloopPlayer _bloop;
  double _elapsedBulletTime = 5;
  bool dragBloop = false;
  Size dimensions;
  EnemyManager _enemyManager;
  Bullet _bullet;
  TextComponent _scoreText;
  int score;

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

    //scoring system
    score = 0;
    _scoreText = TextComponent(
        "Score:" + score.toString(),
        config: TextConfig(fontFamily: 'Audiowide', color: Colors.white),
    );
    add(_scoreText);

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
    if (_elapsedBulletTime >= 0.15){
      _bullet = new Bullet();
      addLater(_bullet);
      _elapsedBulletTime = 0;
    }else{
      _elapsedBulletTime += t;
    }

    // collision
    components.whereType<Enemy>().forEach((enemy) {

      if(enemy.y >= enemy.maxY - ComponentSize/2){
        _bloop.hit();
      }
      if(_bloop.distance(enemy) < 75){
        _bloop.hit();
      }
      //destroy bullet and enemy if they collide and increment the score
      components.whereType<Bullet>().forEach((bullet){
        if(bullet.distance(enemy) < 45){
            bullet.hit();
            enemy.hit();
            score += 1;
          }
        });
    });

    //updates the score
    _scoreText.text = "Score:" + score.toString();

    //if ran out of lives, display game over screen
    if(_bloop.life.value <= 0){
      gameOver();
    }
  }

  @override
  void resize(Size size) {
    super.resize(size);

    //Position the score text
    _scoreText.setByPosition(Position(15 , 50));
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



  //If exit out of app, game is paused rather than continuing in the background
  @override
  void lifecycleStateChange(AppLifecycleState state){
    switch(state){
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        this.pauseGame();
        break;
      case AppLifecycleState.paused:
        this.pauseGame();
        break;
      case AppLifecycleState.detached:
        this.pauseGame();
        break;
    }
  }

  Widget _buildHud(){
    return Stack (children: [
        Positioned(
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
        ),
        Positioned(
          right: 10.0,
          top: 30.0,
          child:
            ValueListenableBuilder(
              valueListenable: _bloop.life,
              builder: (BuildContext context, value, Widget child){
                final list = <Widget>[];

                //displays lives
                for(int i = 0; i < 3; ++i){
                  list.add(
                      Icon(
                        //handles displaying empty hearts
                        i < value ? Icons.favorite : Icons.favorite_border,
                        color: Colors.pink[100],
                        size: 40.0,
                      )
                  );
                }
                return Column(
                  children: list,
                );
              },
            )
        ),
    ]);
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

  Widget _buildGameOverMenu() {
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
                'Game Over',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              Text(
                'Your score was $score',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              IconButton(
                  icon: Icon(
                      Icons.replay,
                      color: Colors.white,
                      size: 40.0),
                  onPressed: (){
                    reset();
                    removeWidgetOverlay('GameOverMenu');
                    resumeEngine();
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

  void gameOver(){
    pauseEngine();
    addWidgetOverlay('GameOverMenu', _buildGameOverMenu());

  }

  //resets the game
  void reset() {
    this.score = 0;
    _bloop.life.value = 3;
    _bloop.fly();

    //remove all enemy components in game
    components.whereType<Enemy>().forEach((enemy) {
      this.markToRemove(enemy);
    });
    //remove all bullets in game
    components.whereType<Bullet>().forEach((bullet) {
      this.markToRemove(bullet);
    });
  }


  }