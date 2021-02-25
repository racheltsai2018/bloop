import 'dart:ui';
import 'package:bloop_app/shooter-game.dart';
import 'package:flame/components/component.dart';


const double numberOfBloopsAlongWidth = 4;
const double bloopBottomSpacing = 10;

class BloopPlayer extends SpriteComponent{

  Size screenSize;
  BloopPlayer() : super.square(200, 'flyingBlob.png'){
    //empty until we make it animation
  }

  //checks if the point is inside the sprite
  bool isInside(double x, double y){
    if(x >= this.x - this.width
        && x <= this.x + this.width
        && y >= this.y - this.height
        && y <= this.y + this.height)
      return true;
    return false;
  }

  // Make sure that the player never goes outside of the screen in the X-axis
  double insideX(dx){
    if (this.x + this.width + dx >= screenSize.width) {
      return screenSize.width - (this.x + this.width);

    } else if (this.x + dx <= 0) {
      return -this.x;
    }else
      return dx;
  }

  // Make sure that the player never goes outside of the screen in the Y-axis
  double insideY(dy){
    if (this.y + this.height + dy >= screenSize.height) {
      return screenSize.height - (this.y + this.height) - 10;
    } else if (this.y + dy <= 0) {
      return -this.y;
    }else
      return dy;
  }

  //Moves player by given amount on x and y axis
  void translateBloop(dx, dy){
    this.x = this.x + dx;
    this.y = this.y + dy;
  }
  @override
  void resize(Size size){
    super.resize(size);
    screenSize = size;
    this.height = this.width = size.width / numberOfBloopsAlongWidth;
    this.x = size.width / 2 - this.width / 2;
    this.y = size.height - this.height - bloopBottomSpacing;
  }

  /*
  final ShooterGame game;
  Rect characterRect;
  Paint characterPaint;

  Character(this.game, double x, double y) {
    characterRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    characterPaint = Paint();
    characterPaint.color = Color(0xfffab29b);
  }

  void render(Canvas c) {
    super.render(c);
    c.drawRect(characterRect, characterPaint);
  } */


}