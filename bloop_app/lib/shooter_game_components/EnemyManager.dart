import 'dart:math';
import 'dart:ui';

import 'package:bloop_app/shooter-game.dart';
import 'package:bloop_app/shooter_game_components/enemy.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';

class EnemyManager extends Component with HasGameRef<ShooterGame>{
  Random _random;
  Timer _timer;
  Size screenSize;
  List right, left;

  EnemyManager(){
    _random = Random();
    _timer = Timer(10, repeat: true, callback: (){
      spawnEnemies();
    });

  }
  void spawnEnemies() {
      final randomNum = _random.nextInt(5);
      //final enemy = Enemy();
      //gameRef.addLater(enemy);
    attackLines();
  }

  @override
  void onMount(){
    super.onMount();
    _timer.start();
   }

  @override
  void resize(Size size){
    super.resize(size);
    screenSize = size;
  }

  @override
  void update(double t) {
    _timer.update(t);

  }

  void attackLines(){
    double targetX = ComponentSize;
    left = new List<Enemy>.generate(5, (i) => new Enemy());
    left.forEach((enemy) {
      enemy.y = 25.0;
      enemy.x = -20.0;
      enemy.targetX = targetX;
      targetX += ComponentSize;
      enemy.direction = 'left';
      enemy.setSpeed(200.0);
      gameRef.addLater(enemy);
    });

    targetX = screenSize.width - ComponentSize;
    right = new List.generate(4, (i) => new Enemy());

    right.forEach((enemy) {
      enemy = new Enemy();
      enemy.y = 30.0;
      enemy.x = screenSize.width + 20.0;
      enemy.targetX = targetX;
      targetX -= ComponentSize;
      enemy.direction = 'right';
      enemy.setSpeed(200.0);
      gameRef.addLater(enemy);
    });

  }

  void reset(){
    // TODO: implement reset
    //reset spawnlevel to 0
    //reset timer
  }

  @override
  void render(Canvas c) {
    // TODO: implement render
  }


}