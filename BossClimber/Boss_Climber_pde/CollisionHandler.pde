/* //<>// //<>//
  Welkom bij de Collision Class, dit is hoe je hem gebruikt: 
 
 1. maak een collision boolean aan in de global variables:
 boolean hasCollision = false;
 2. Roep deze functie en variable aan in de update loop:
 checkCollision(float objectX, float objectY, float objectRadius);
 hasCollision = collisionHandler.hit;
 3. vervang "float objectX, float objectY, float objectRadius" 
 in de functie checkCollision met de positie X en Y en de hoogte/radius van het object.
 4. gebruik nu de hasCollision boolean in jou code om te bepalen wat er gebeurt als het object collide
 
 De collision is nu alleen nog voor de platforms, als je wilt dat het ook met andere objecten gaat werken stuur me even je code en ik zal proberen het 
 ook te laten werken met die code.
 */
class CollisionHandler
{
  boolean hit = false;
  boolean hitPlayer = false;
  boolean hitLadder = false;
  PVector platformHitPos;
  float platformHeight;
  boolean[] hitPlatform = new boolean[level.platform.length];
  PVector posBeforeCollision;

  //object met player collision

  void checkCollisionPlayer(float objectX, float objectY, float objectRadius) {
    hitPlayer = circleRect(objectX, objectY, objectRadius, player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, player.sizePlayer.y);
  }



  //Object met platform collision
  void checkCollision(float objectX, float objectY, float objectRadius)
  {
    for (int i = 0; i < level.platform.length; i++)
    {
      Platform platform = level.platform[i];
      hit = circleRect(objectX, objectY, objectRadius, platform.x, platform.y, platform.w, platform.h);

      if (hit) {
        swap(level.platform, 0, i);
      } else {
        swap(level.platform, i, 0);
      }
    }
  }

  void checkPlatformUnderground(float objectX, float objectY, float objectRadius)
  {
    for (int i = 0; i < level.platform.length; i++)
    {
      Platform platform = level.platform[i];
      hit = circleRect(objectX, objectY, objectRadius, platform.x, platform.y, platform.w, platform.h);
      if (hit) {
        swap(level.platform, 0, i);
      } else {
        swap(level.platform, i, 0);
      }
    }
  }

  boolean circleRect(float objectX, float objectY, float radius, float rx, float ry, float rw, float rh) {

    //temporary variables for testing edges
    float testX = objectX;
    float testY = objectY;

    if (objectX < rx-rw/2)         testX = rx-rw/2;      // compare left edge
    else if (objectX > rx+rw/2) testX = rx+rw/2;   // right edge
    if (objectY < ry)         testY = ry;      // top edge
    else if (objectY > ry+rh) testY = ry+rh;   // bottoobjectXm edge

    // get distance from closest edges
    float distX = objectX-testX;
    float distY = objectY-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );
    println( rh + " " + distance +  " " + radius );
    //als distanse kleiner is dan de radus dan heb je collision
    if (distance <= radius) {
      platformHitPos = new PVector(rx, ry);
      posBeforeCollision = new PVector(objectX, objectY);
      platformHeight = rh;
      return true;
    } else {
      return false;
    }
  }
  void swap(Platform[] input, int index_A, int index_B) {
    Platform temp = input[index_A];

    input[index_A] = input[index_B];
    input[index_B] = temp;
  }
}
