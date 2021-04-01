import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/time.dart';

class EnemyManager extends Component{
  Random _random;
  Timer _timer;

  EnemyManager(){
    _random = Random();
    _timer = Timer(4, repeat: true, callback: (){});

  }
  @override
  void render(Canvas c) {
    // TODO: implement render
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

}