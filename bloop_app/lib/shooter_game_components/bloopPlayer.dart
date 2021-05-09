import 'dart:ui';
import 'package:flame/anchor.dart';
import 'package:flame/animation.dart' as flame;
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/time.dart';
import 'package:flutter/cupertino.dart';


const double numberOfBloopsAlongWidth = 4;
const double bloopBottomSpacing = 10;

class BloopPlayer extends AnimationComponent{

  //Indicates if the bloop player is hit or not
  bool _isHit;

  //Keeps track of number of lives
  ValueNotifier<int> life;

  //Used to return bloop to regular fly state
  Timer _timer;

  Size screenSize;

  // Reference to fly and hit animations
  flame.Animation _flyAnimation;
  flame.Animation _hitAnimation;

  BloopPlayer() : super.empty(){

    final spriteSheet = SpriteSheet(
        imageName: 'Hit.png',
        textureWidth: 1750,
        textureHeight: 1750,
        columns: 2,
        rows: 1);

    _flyAnimation = spriteSheet.createAnimation(0, from: 0, to: 1, stepTime: 0.1);
    _hitAnimation = spriteSheet.createAnimation(0, from: 0, to: 2, stepTime: 0.1);
    this.animation = _flyAnimation;

    _isHit = false;
    this.anchor = Anchor.center; // moves the origin from top left corner to center of the sprite

    //Calls fly method after 1 second every time _timer.start is called
    //Used to return bloop to regular fly state after losing a life
    _timer = Timer(1, callback: () {
      fly();
    });

    //initial number of bloop player lives
    life = ValueNotifier(3);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // NOTE: Never forget to update the timer, because Flame's timer
    // depends on gameloop's update for its calculations.
    _timer.update(dt);
  }

  void hit(){
    if(!_isHit) {
      _isHit = true;
      this.animation = _hitAnimation;
      life.value -= 1;
      _timer.start();
    }
  }

  // return bloop to regular state of flying
  void fly(){
    _isHit = false;
    this.animation = _flyAnimation;
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


}