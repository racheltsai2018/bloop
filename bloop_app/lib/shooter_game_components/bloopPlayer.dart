import 'dart:ui';
import 'package:bloop_app/shooter-game.dart';
import 'package:flame/anchor.dart';
import 'package:flame/components/component.dart';


const double numberOfBloopsAlongWidth = 4;
const double bloopBottomSpacing = 10;

class BloopPlayer extends SpriteComponent{

  bool _isHit;

  Size screenSize;
  BloopPlayer() : super.square(100, 'bloopPlayer.png'){
    // todo: finish player constructor with animations
    //empty until we make it animation
    _isHit = true;
    this.anchor = Anchor.center; // moves the origin from top left corner to center of the sprite
  }

  // todo: add hit animation
  void hit(){
    if(!_isHit) {
      _isHit = true;
    }
    print('Hit!');
  }

  // todo: add fly animation
  // return bloop to regular state of flying
  void fly(){
    _isHit = false;
  }
  //checks if the point is inside the sprite
  bool isInside(double x, double y){
    if(x >= this.x - this.width/2
        && x <= this.x + this.width/2
        && y >= this.y - this.height/2
        && y <= this.y + this.height/2)
      return true;
    return false;
  }

  // Make sure that the player never goes outside of the screen in the X-axis
  double insideX(dx){

    // right
    if (this.x + dx >= screenSize.width) {
      return screenSize.width - (this.x);

      // left
    } else if (this.x + dx <= 0) {
      return -this.x;
    }else
      return dx;
  }

  // Make sure that the player never goes outside of the screen in the Y-axis
  double insideY(dy){
      // bottom
    if (this.y + dy >= screenSize.height) {
      return screenSize.height - (this.y ) - bloopBottomSpacing;

      // top
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
    this.x = size.width / 2;
    this.y = size.height - (this.height/2) - bloopBottomSpacing;
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