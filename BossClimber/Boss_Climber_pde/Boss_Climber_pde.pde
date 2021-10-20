Player player;
CollisionHandler collisionHandler;
Platform platforms;
Health health;
HealthBar healthbar;
Jumpboost jumpboost;
Level level;
Fireball[] fireballs;
Vlammenwerper vlammenwerper;
Dragon Dragon1;
final int maxToetsen = 1024; //kan niet worden aangepast.
boolean[] keysPressed = new boolean[maxToetsen]; //als ik op een toets druk, wordt een van de waarden in deze array van false naar true gezet.

void setup() 
{
  size(800, 600);
  rectMode(CENTER);
  frameRate(60);
  level = new Level();
  player = new Player();
  platforms = new Platform();
  collisionHandler = new CollisionHandler();
  health = new Health();
  healthbar = new HealthBar(width - 250/2 - 10, height - 10/2 - 10, 250, 10);
  jumpboost = new Jumpboost();
  fireballs = new Fireball[20];
  vlammenwerper = new Vlammenwerper();
  Dragon1 = new Dragon(152,50,46);
  level.setup();
  for (int i =0; i != fireballs.length; i++) { 
    fireballs[i] = new Fireball();
  }
  vlammenwerper.setup();
}

void update()
{
  vlammenwerper.update();
  player.movementUpdate();
  jumpboost.update();
  collisionHandler.update();
  health.update();
  //for (int i =0; i != fireballs.length; i++) { 
  //  fireballs[i].movementUpdate();
  //}
  //for (int i = 0; i != fireballs.length; i++) {
  //  fireballs[i].respawn();
  //}
}

void draw()
{
  background(0);
  update();
  for (int i =0; i < fireballs.length; i++) { 
    fireballs[i].draw();
  }
  vlammenwerper.draw();
  platforms.draw();
  level.draw();
  player.draw();
  jumpboost.draw();
  healthbar.draw();
  Dragon1.draw();
  health.draw();
}

void keyPressed()
{
  //we hebben een toets ingedrukt.
  keysPressed[keyCode] = true;
}

void keyReleased()
{
  //we hebben een toets losgelaten.
  keysPressed[keyCode] = false;
}
