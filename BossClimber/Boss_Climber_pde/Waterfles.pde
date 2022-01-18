//Dion
class WaterBottle{
  CollisionHandler collisionHandler;
  Drop drops;
  float bottleX = spawnPointsPUPS.underR.x, bottleY = spawnPointsPUPS.underR.y, bottleWidth, bottleHeight, resetBottleX, resetBottleY, bottleScore, bottleScoreCount, resetBottleWidth, resetBottleHeight,
        farAwayX, farAwayY;
  color blue = color(0, 0, 255);
  boolean dropOn = false;
  boolean spawnWaterfles = false;
  boolean dropOff = false;
  boolean pickedUp = false; //Needed for inventory
  boolean catchWaterBottle = true;
  boolean reset = false;
  boolean fight = false;
  boolean timedReset = false;
  boolean seeScoreBottle = false;
  final float TEXT_SIZE = 30;

  WaterBottle() {
    collisionHandler = new CollisionHandler();
    drops = new Drop();
    bottleWidth = 20;
    bottleHeight = 20;
    bottleScore = 25;
    bottleScoreCount = 100;
    resetBottleHeight = 20;
    resetBottleWidth = 20;
    resetBottleX = 100;
    resetBottleY = 400;
    farAwayX = 2048;
    farAwayY = 1152;
  }

  void updateWaterBottle() {
     if (dragon.fight && !pickedUp && !fight) {
       if (dragon.fight && !pickedUp && !fight && !dropOn) {
        bottleX = spawnPointsPUPS.fightM.x;
        bottleY = spawnPointsPUPS.fightM.y;
        fight = true;
       }
      }

      if (schild.pickedUp && pickedUp || sword.pickedUp && pickedUp) {
        pickedUp = false;
        reset = true;
        timedReset = true;
      }
      
      //Collision player & waterfles
      if (!schild.pickedUp){
        if (bottlePlayer(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, player.sizePlayer.y, bottleX, bottleY, bottleWidth, bottleHeight)) {
          bottleX = farAwayX;
          bottleY = farAwayY;
          pickedUp = true;
          scoreHandler.score += bottleScore;
          fight = false;
          seeScoreBottle = true;
        }
      }
      
      if (reset) {
        resetWaterBottle();
        fight = false;
        timedReset = false;
        reset = false;
      }

      //Timer goes on when you hit the waterbottle
      if (seeScoreBottle) {
        bottleScoreCount--;
      }

      if (bottleScoreCount < endSeeScore) {
        seeScoreBottle = false;
        bottleScoreCount = resetSeeScore;
      }
     }

  void resetWaterBottle() {//Reset new waterbottle
    pickedUp = false;
    bottleScoreCount = resetSeeScore;
    if (!dragon.fight || dragon.fight) {
      bottleX = resetBottleX;
      bottleY = resetBottleY;
    }
    bottleWidth = resetBottleWidth;
    bottleHeight = resetBottleHeight;
    drops.posPlayer.x = player.posPlayer.x;
    drops.posPlayer.y = player.posPlayer.y;
    drops.hasCollision = false;
  }

  void draw() {
<<<<<<< HEAD
    fill(blue);
=======
    fill(0, 0, 255);
    image(inventory.waterflesIOutline, bottleX, bottleY, bottleWidth*1.2, bottleHeight*1.2);
>>>>>>> d8dc88e18d7e9232a618086501e47e116839d3bf
    image(inventory.waterflesI, bottleX, bottleY, bottleWidth, bottleHeight);

    if (seeScoreBottle) {
      fill(white);
      textSize(TEXT_SIZE);
      text("+ 25", player.posPlayer.x, player.posPlayer.y - schild.seeScoreDistance.y);
    }
  }
  
  //Collision player & waterbottle
  boolean bottlePlayer(float bx, float by, float bw, float bh, float px, float py, float pw, float ph){
    if (bx <= px + pw && bx + bw >= px &&
        by <= py + ph && by + bh >= py){
      return true;
    }
     return false;
  }
}
