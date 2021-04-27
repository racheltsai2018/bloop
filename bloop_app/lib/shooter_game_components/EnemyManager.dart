import 'dart:math';
import 'dart:ui';

import 'package:bloop_app/shooter-game.dart';
import 'package:bloop_app/shooter_game_components/enemy.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';

class EnemyManager extends Component with HasGameRef<ShooterGame> {
  Random _random;
  Timer _timer;

  EnemyManager() {
    _random = Random();
    _timer = Timer(4, repeat: true, callback: () {
      spawnEnemies();
    });
  }

  void spawnEnemies() {
    final randomNum = _random.nextInt(10);
    final enemy = Enemy();
    gameRef.addLater(enemy);
  }

  @override
  void onMount() {
    super.onMount();
    _timer.start();
  }

  @override
  void render(Canvas c) {
    // TODO: implement render
  }

  @override
  void update(double t) {
    // TODO: implement update
    _timer.update(t);
  }


  void reset() {
    // TODO: implement reset
    //reset spawnlevel to 0
    //reset timer
  }
}