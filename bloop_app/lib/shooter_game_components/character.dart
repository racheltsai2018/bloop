import 'dart:ui';
import 'package:bloop_app/shooter-game.dart';

class Character {

  final ShooterGame game;
  Rect characterRect;
  Paint characterPaint;

  Character(this.game, double x, double y) {
    characterRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    characterPaint = Paint();
    characterPaint.color = Color(0xfffaf29b);
  }

  void render(Canvas c) {
    c.drawRect(characterRect, characterPaint);
  }

  void update(double t) {

  }
}