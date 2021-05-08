import 'dart:math';
import 'dart:ui';

import 'package:bloop_app/shooter-game.dart';
import 'package:bloop_app/shooter_game_components/enemy.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';

class EnemyManager extends Component with HasGameRef<ShooterGame>{
  Random _random;
  Timer _grouptimer;
  Timer _singletimer;
  Size screenSize;
  List right, left;

  EnemyManager(){
    _random = Random();
    _grouptimer = Timer(5, repeat: true, callback: (){
      spawnGroupEnemies();
    });
    _singletimer = Timer(1, repeat: true, callback: (){
      spawnSingleEnemy();
    });

  }
  void spawnGroupEnemies() {
    attackLines();
  }

  void spawnSingleEnemy(){
    final randomNum = _random.nextInt(8);
    Enemy enemy = new Enemy();
    enemy.x = screenSize.width/10 +  randomNum * screenSize.width/10;
    enemy.setSpeed(300.0);
    gameRef.addLater(enemy);
  }

  @override
  void onMount(){
    super.onMount();
    _grouptimer.start();
    _singletimer.start();
   }

  @override
  void resize(Size size){
    super.resize(size);
    screenSize = size;
  }

  @override
  void update(double t) {
    _grouptimer.update(t);
    _singletimer.update(t);

  }

  void attackLines(){
    double targetX = ComponentSize/2;
    left = new List<Enemy>.generate(4, (i) => new Enemy());
    left.forEach((enemy) {
      enemy.y = 30.0;
      enemy.x = (screenSize.width/2) - ComponentSize/2;
      enemy.targetX = targetX;
      targetX += ComponentSize;
      enemy.direction = 'left';
      enemy.setSpeed(200.0);
      gameRef.addLater(enemy);
    });

    targetX = screenSize.width - ComponentSize/2;
    right = new List.generate(3, (i) => new Enemy());

    right.forEach((enemy) {
      enemy = new Enemy();
      enemy.y = 30.0;
      enemy.x = (screenSize.width/2) + ComponentSize;
      enemy.targetX = targetX;
      targetX -= ComponentSize;
      enemy.direction = 'right';
      enemy.setSpeed(200.0);
      gameRef.addLater(enemy);
    });

  }

  @override
  void render(Canvas c) {
  }


}