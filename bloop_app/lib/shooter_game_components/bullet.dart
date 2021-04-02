import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:bloop_app/shooter-game.dart';
import 'package:flutter/cupertino.dart';

import 'enemy.dart';

const double bulletSpeed = 500;
ShooterGame game = ShooterGame();

class Bullet extends SpriteComponent{
  bool exploded = false;
  double maxHeight;
  bool isHit = false;

  // List<Enemy> enemyList = <Enemy>[];
  // List<Bullet> bulletList = <Bullet>[];

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

    // if(enemyList.isNotEmpty)
    //   enemyList.forEach((enemy){
    //     bool remove = this.toRect().contains(enemy.toRect().bottomCenter) ||
    //         this.toRect().contains(enemy.toRect().bottomLeft) ||
    //         this.toRect().contains(enemy.toRect().bottomRight);
    //     if(remove){
    //       ShooterGame.points += 1;
    //       enemy.remove = true;
    //       exploded = true;
    //       enemyList.remove(enemy);
    //       print('Points: $ShooterGame.points');
    //     }
    //   }
    //   );
    //print(enemyList.length);
    //print(enemyList);
  }

  @override
  void resize(Size size){
    super.resize(size);
    maxHeight = size.height;
    this.y = playerY;
    this.x = playerX + 45;
  }

  // void addToEnemyList(Enemy e){
  //   enemyList.add(e);
  // }

  void hit(){
    isHit = true;
    exploded = true;
  }

}