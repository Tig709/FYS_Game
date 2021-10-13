class Fireball {

  //variables
  PVector posFireball = new PVector(200, 50);
  PVector sizeFireball = new PVector(20, 20);
  PVector newPosFireball = new PVector(posFireball.x, posFireball.y);
  PVector velocity = new PVector(0, 0);
  final float GRAVITY = 0.098f;
  private float timer = 0;
  boolean hasJumped = false, hasDoubleJumped = false, hasTripleJumped = false, hasDashed = false, hasCollision = false, wallCollison = false;

  void draw() {
    //modes
    ellipseMode(CENTER);
    rectMode(CENTER);

    //Fireball
    fill(255, 0, 0);
    ellipse(posFireball.x, posFireball.y, sizeFireball.x, sizeFireball.y);
  }
  void movementUpdate()
  {
    checkCollision(posFireball.x, posFireball.y, sizeFireball.y);
    hasCollision = collisionHandler.hit;
    if (!hasCollision)
    {
      velocity.y += GRAVITY; //werkt alleen als ik niet op een platform sta.
    } else {
      collideWithPlatform();
      velocity.x = 2;
      velocity.y = 2;
    }
    posFireball.x += velocity.x;
    posFireball.y += velocity.y;
    timer ++;
      if (timer >= frameRate * 5) {
        //spawn fireBall
        newPosFireball.x = posFireball.x;
        newPosFireball.y = posFireball.y;
        timer = 0;
    }
  }


  void checkCollision(float objectX, float objectY, float objectRadius) {
    collisionHandler.checkCollision(objectX, objectY, objectRadius);
  }

  void collideWithPlatform()
  {
    velocity.y = 0;
    hasCollision = true;
    hasDoubleJumped = false;
    posFireball.y = collisionHandler.platformHitPos.y - collisionHandler.platformHeight * 2;
  }
}
