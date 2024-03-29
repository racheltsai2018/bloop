import 'dart:ui';

import 'package:flame/anchor.dart';
import 'package:flame/components/component.dart';
import 'package:bloop_app/shooter-game.dart';
import 'package:flutter/cupertino.dart';

import 'enemy.dart';

const double bulletSpeed = 400;
ShooterGame game = ShooterGame();

class Bullet extends SpriteComponent{
  bool exploded = false;
  double maxHeight;

  Bullet(): super.square(50, 'shootingStar.png'){
    this.anchor = Anchor.center; // moves the origin from top left corner to center of the sprite
  }

  @override
  bool destroy() {
    if(exploded)
      return true;
    else if(this.y < -10) {
      return true;
    }
    else
      return false;
  }

  void hit(){
    exploded = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    y -= dt * bulletSpeed;
  }

  @override
  void resize(Size size){
    super.resize(size);
    maxHeight = size.height;
    this.y = playerY - 50;
    this.x = playerX;
  }

  // void addToEnemyList(Enemy e){
  //   enemyList.add(e);
  // }


}