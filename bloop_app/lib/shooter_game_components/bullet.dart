import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:bloop_app/shooter-game.dart';
import 'package:flutter/cupertino.dart';

const double bulletSpeed = 500;

class Bullet extends SpriteComponent{
  bool exploded = false;
  double maxHeight;

  Bullet(): super.square(15, 'pew.png');

  @override
  bool destroy() {
    if(exploded)
      return true;
    else if(this.y < -maxHeight) {
      return true;
    }
    else
      return false;
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    y -= dt * bulletSpeed;
  }

  @override
  void resize(Size size){
    super.resize(size);
    maxHeight = size.height;
    this.y = playerY;
    this.x = playerX + 45;
  }
}