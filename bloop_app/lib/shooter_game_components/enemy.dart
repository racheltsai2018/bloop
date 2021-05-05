import 'package:flame/anchor.dart';
import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

const SPEED = 120.0;
const ComponentSize = 40.0;

class Enemy extends SpriteComponent{
  Size dimensions;
  //Enemy(this.dimensions) : super.square(ComponentSize, 'dragon.png');
  Enemy() : super.square(ComponentSize, 'dragon.png'){
    this.anchor = Anchor.center; // moves the origin from top left corner to center of the sprite
  }
  double maxY;
  bool remove = false;
  bool isHit = false;


  @override
  void update(double t){
    super.update(t);
    y += t * SPEED;
    if (this.y > maxY){
        remove = true;
    }
  }

  // This method is called every loop and needs to return true if the enemy is dead/off screen
  @override
  bool destroy(){
    if(remove){
      return true;
    }
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
    if(!isHit){
      isHit = true;
      remove = true;
    }

  }

}
