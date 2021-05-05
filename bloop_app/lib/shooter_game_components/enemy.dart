import 'package:bloop_app/shooter_game_components/EnemyManager.dart';
import 'package:flame/anchor.dart';
import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';


const ComponentSize = 40.0;
const NormalSpeed = 120.0;

class Enemy extends SpriteComponent{
  Size dimensions;
  int lives = 3;
  double _speed = 120.0;
  double targetX, targetY = 0;
  String direction = '';
  //Enemy(this.dimensions) : super.square(ComponentSize, 'dragon.png');
  Enemy() : super.square(ComponentSize, 'dragon.png'){
    this.anchor = Anchor.center; // moves the origin from top left corner to center of the sprite
  }
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
      _speed = 100;
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
    this.x = size.width/2;
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
