import 'package:flame/anchor.dart';
import 'package:flame/animation.dart' as flame;
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/material.dart';


const ComponentSize = 50.0;
const NormalSpeed = 120.0;

class Enemy extends SpriteComponent{
  Size dimensions;
  int lives = 3;
  double _speed = 120.0;
  double targetX, targetY = 0;
  String direction = '';

  Enemy() : super.square(ComponentSize, 'Enemy.png');

  // This is the animation for the Enemy however it doesn't work. Enemy just doesn't show up
  // No idea why because this code is virtually the same as the player class

  /*
  flame.Animation _animation;

  Enemy() : super.empty(){
    final spriteSheet = SpriteSheet(
        imageName: 'Enemy_Sprite_Sheet.png',
        textureWidth: 50,
        textureHeight: 50,
        columns: 4,
        rows: 1);

    _animation = spriteSheet.createAnimation(0, from: 0, to: 4, stepTime: 0.1);
    this.animation = _animation;
    this.anchor = Anchor.center; // moves the origin from top left corner to center of the sprite
  }
  */
  double maxY;
  bool remove = false;
  bool isHit = false;
  bool wait = true;


  @override
  void update(double t){
    super.update(t);
    if(wait) {
      if(direction == 'right' && x < targetX){
          x += _speed * t;

      }else if (direction == 'left' && x > targetX){
        x -= _speed * t;

      }else{
      wait = false;
      _speed = NormalSpeed;
      }
    }else{
      y += t * _speed;
    }
    if (this.y >= maxY){
        remove = true;
    }
  }

  // This method is called every loop and needs to return true if the enemy is dead/off screen
  @override
  bool destroy(){
    if(y == null || maxY == null){
      return false;
    }
    return remove;
  }

  @override
  void resize(Size size) {
    super.resize(size);
    this.x = x;
    this.y = y;
    this.maxY = size.height;
  }

  void hit(){
      isHit = true;
      lives--;
      if(lives <= 0) {
        remove = true;
    }
  }
 void setSpeed(double speed){
   _speed = speed;
 }

}
