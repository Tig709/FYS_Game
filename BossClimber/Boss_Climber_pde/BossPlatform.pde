//Tigo
// Welkom in de bossplatform class in deze class word de boss room gemaakt.

//int bpX, bpY, bpW, bpH;


//int x1 = width/12;
//int x2 = width/2;
//int rw = 200;
//int rh = 25;
//int ry = 3*rh;
//int qx1 = x1+rw;
//int qh = ry+rh;
//int qh2 = qh+rh;
//PVector[] vertexesBossPlatform = new PVector[8];
//int newX1, newX2, newRW, newRH, newRY, newQX1, newQH, newQH2;
//int levelMove = 0;

float playerPosRect = 15;
float playerPosReset = 40;
float background;
float xPosRect = 0;
float xPosRect1 = 1;
float rectClosingNumber = 100;
float yPosRect = 50;
float yPosLava = 10;
float yPosLava1 = 100;
boolean bossFightRoom = false;
int lavaNumber = 78;
int lavaCenter = 39;
int randomNumber = 0;
int randomNumber1= 1;
int randomNumber2 = 2;

int totalTime = 100; //100 frames * 60 fps = 6000 milliseconds
int savedTime;
int savedTime2;
int savedTime3;
boolean timer = false;
boolean timer2 = false;
boolean timer3 = false;

int lavaY = 0;
boolean lavaTrigger = false;
int randomNumberLava;
int randomNumberLava1;
int randomNumberLava2;
int minLava=0;
int maxLava=10;
int maxLavaLength = 100;
float greyColor = 147;
int muurGetal = 12;
float exclamationHeight = 200;
float exclamationNumber = 8;
float exclamationSize = 200;
float exclamationR = 255;
float exclamationGB = 0;
float LavaY2 = 200;
float lavaImgHeight = 55;
boolean lavaUp = false;
boolean lavaDown = false;


void Bossplatform() {
  dragon.healthbarDragon.draw();
  dragon.fight = bossFightRoom;
  //if (Platform.draw.moveAmount) {
  fill(greyColor);
  //background(0);
  rectMode(CORNER);
  rect(xPosRect, height-yPosRect, xPosRect1, height);
  xPosRect1 = xPosRect1 + rectClosingNumber;
  noStroke();
  fill(#FAB800);
  rect(xPosRect, height - yPosLava, lavaNumber, yPosLava1);
  muur();

  bossFightRoom = true;
  if (bossFightRoom) {
    On = false;
    BossFightLava();
  }


  //for collision
  //change vertexes in both arrays to match the bossplatform
  for (int i = 0; i < platforms.vertexesL.length; i += 5) {
    platforms.vertexesL[i] = new PVector(xPosRect, height-yPosRect);
    platforms.vertexesL[i+1] = new PVector(xPosRect1, height-yPosRect);
    platforms.vertexesL[i+2] = new PVector(xPosRect, height);
    platforms.vertexesL[i+3] = new PVector(xPosRect1, height);
    platforms.vertexesL[i+4] = new PVector(xPosRect, height-yPosRect);
  }
  for (int i = 0; i < platforms.vertexesR.length; i += 5) {
    platforms.vertexesR[i] = new PVector(xPosRect, height-yPosRect);
    platforms.vertexesR[i+1] = new PVector(xPosRect1, height-yPosRect);
    platforms.vertexesR[i+2] = new PVector(xPosRect, height);
    platforms.vertexesR[i+3] = new PVector(xPosRect1, height);
    platforms.vertexesR[i+4] = new PVector(xPosRect, height-yPosRect);
  }

  if (player.posPlayer.y>height-playerPosRect && bossFightRoom)
  {
    player.posPlayer.y=height-playerPosReset;
  }
}

void BossFightLava() {
  fill(#FAB800);

  if (!timer) {
    int passedTime = savedTime++;
    println("1e timer: " + savedTime);

    if (passedTime > 10) {
      println("1e timer is kaar");

      timer = true;
      timer2 = false;
      timer3 = false;
      savedTime = 0;

      randomNumber = int(random(minLava, maxLava));

      randomNumber1 = int(random(minLava, maxLava));
      if (randomNumber1==randomNumber) {
        randomNumber1=int(random(minLava, maxLava));
      }

      randomNumber2 = int(random(minLava, maxLava));
      if (randomNumber2==randomNumber1||randomNumber2==randomNumber) {
        randomNumber=int(random(minLava, maxLava));
      }
    }
  }
  if (!timer2 && timer) {
    int passedTime2 = savedTime2++;
    println("2e timer: " + savedTime2);

    if (passedTime2 > totalTime) {
      println("2e timer is kaar");

      timer2 = true;
      lavaTrigger = true;
      savedTime2 = 0;
    }
  }
  if (lavaTrigger) {
    int passedTime3 = savedTime3++;
    println("3e timer: " + savedTime3);

    if (passedTime3 > totalTime) {
      println("3e timer is kaar");

      lavaTrigger = false;
      timer = false;
      timer2 = false;
      savedTime3 = 0;
    }
  }

  for (int i=0; i<bossfightlava.length; i++) {


    //bossfightlava[i] = width/muurGetal+(lavaNumber*i);
    //if (lavaTrigger) {

    //  LavaY2 = 100;

    //  rect(bossfightlava[randomNumberLava], height-lavaY, lavaNumber, LavaY2);
    //  rect(bossfightlava[randomNumberLava1], height-lavaY, lavaNumber, LavaY2);
    //  rect(bossfightlava[randomNumberLava2], height-lavaY, lavaNumber, LavaY2);

    //for (int i=0; i<bossfightlava.length; i++) {

    bossfightlava[i] = width/muurGetal+(lavaNumber*i);
    //println(bossfightlava[i]);


    if (timer && !lavaTrigger) {

      textSize(exclamationSize);
      fill(exclamationR, exclamationGB, exclamationGB);

      text("!", bossfightlava[randomNumber]+lavaCenter, height-exclamationHeight);
      text("!", bossfightlava[randomNumber1]+lavaCenter, height-exclamationHeight);
      text("!", bossfightlava[randomNumber2]+lavaCenter, height-exclamationHeight);
      println(bossfightlava[randomNumber]+exclamationNumber);


      randomNumberLava = this.randomNumber;
      randomNumberLava1 = this.randomNumber1;
      randomNumberLava2 = this.randomNumber2;
      lavaY = 0;
      lavaUp = true;
      lavaDown = false;
    }
    for (int j = 0; j<level.lavaSlicedImg.length; j++) {
      image(level.lavaSlicedImg[j], bossfightlava[j]+lavaCenter, height+lavaImgHeight, lavaNumber, LavaY2);
    }

    if (lavaTrigger) {


      image(level.lavaSlicedImg[randomNumberLava], bossfightlava[randomNumberLava]+lavaCenter, height-lavaY, lavaNumber, LavaY2);
      image(level.lavaSlicedImg[randomNumberLava1], bossfightlava[randomNumberLava1]+lavaCenter, height-lavaY, lavaNumber, LavaY2);
      image(level.lavaSlicedImg[randomNumberLava2], bossfightlava[randomNumberLava2]+lavaCenter, height-lavaY, lavaNumber, LavaY2);
      if (lavaUp) {
        if (lavaY<=maxLavaLength) {
          lavaY++;
        }
        if (lavaY==maxLavaLength) {
          lavaUp = false;
          lavaDown = true;
        }
      }
      if (lavaDown) {
        lavaY--;
      }
    }

    println("lavaTrigger: " + lavaTrigger);
    //line(bossfightlava[randomNumber]+lavaCenter,0,bossfightlava[randomNumber]+lavaCenter,height);
  }
  //for (int i = 0; i<level.lavaSlicedImg.length; i++) {
  //     image(level.lavaSlicedImg[i],bossfightlava[i]+lavaCenter, height+55, lavaNumber, LavaY2);

  //   }
}

//if(bossFightRoom){
//playerpos
//dragonpos
//powerups uit



//bpX = width/12;
//bpY = 50+platforms.levelMove;
//bpW = 30;
//bpH = 10;

//fill(#64ED16);
//rect(bpX, bpY, bpW, bpH);

//fill(#64ED16);
//  fill(147, 147, 147);
//  noStroke();
//  if (mouseY <= 50) {
//    levelMove++;
//  }
//  if (levelMove >= 400) {
//    levelMove = 400;
//  }
//  newRW = rw + levelMove; 
//  newRH = rh + levelMove;
//  newRY = ry + levelMove;
//  newQX1 = qx1 + levelMove;
//  newQH = qh + levelMove;
//  newQH2 = qh2+ levelMove;

//  //bewegende quads
//  quad(x1, newRY, qx1, newRY, qx1, newQH, x1, newQH);
//  quad(qx1, newRY, qx1, newQH, width/2+120, newQH2, width/2+120, newQH);

//  //statische quads
//  quad(x1, ry, qx1, ry, qx1, qh, x1, qh);


//  int i = 0;
//  vertexesBossPlatform[i] = new PVector(x1, ry);
//  vertexesBossPlatform[i+1] = new PVector(qx1, ry);
//  vertexesBossPlatform[i+2] = new PVector(qx1, qh);
//  vertexesBossPlatform[i+3] = new PVector(width/2+120, qh+rh);
//  vertexesBossPlatform[i+4] = new PVector(width/2+120, qh);
//  vertexesBossPlatform[i+5] = new PVector(qx1, ry);
//  vertexesBossPlatform[i+6] = new PVector(x1, qh);
//  vertexesBossPlatform[i+7] = new PVector(x1, ry);
