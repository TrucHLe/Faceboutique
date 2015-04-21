/* @pjs preload="storeIm/DarkKnight.png, storeIm/Prada.png, storeIm/Sephora.png,
storeIm/Foursquare.png, storeIm/PrideAndPrejudice.png, storeIm/WaltDisneyRecords.png,
storeIm/Minecraft.png, storeIm/CupOfJoe.png, storeIm/Obamacare.png,
storeIm/Tatoo.png, storeIm/Rocky.png, storeIm/Milkshake.png,
storeIm/AdidasOriginals.png, storeIm/CompassionInternational.png,
storeIm/BookOfHadith.png, storeIm/CurlyFries.png, storeIm/Covergirl.png,
storeIm/Broadway.png, storeIm/Starcraft.png, storeIm/Bauhaus.png,
storeIm/TheBachelor.png, storeIm/HawthroneHeights.png, storeIm/HolyBible.png,
storeIm/Fantasia.png, storeIm/Biology.png, storeIm/BigMommas.png,
storeIm/GeorgeWBushCenter.png, storeIm/MountainBike.png, storeIm/Footlocker.png,
storeIm/Vocaloid.png, storeIm/ASPCA.png, storeIm/Bungie.png, storeIm/HungerGames.png,
storeIm/VampiresEverywhere.png, storeIm/Tacori.png, storeIm/UnderArmour.png,
storeLa/DarkKnight.png, storeLa/Prada.png, storeLa/Sephora.png,
storeLa/Foursquare.png, storeLa/PrideAndPrejudice.png, storeLa/WaltDisneyRecords.png,
storeLa/Minecraft.png, storeLa/CupOfJoe.png, storeLa/Obamacare.png,
storeLa/Tatoo.png, storeLa/Rocky.png, storeLa/Milkshake.png,
storeLa/AdidasOriginals.png, storeLa/CompassionInternational.png,
storeLa/BookOfHadith.png, storeLa/CurlyFries.png, storeLa/Covergirl.png,
storeLa/Broadway.png, storeLa/Starcraft.png, storeLa/Bauhaus.png,
storeLa/TheBachelor.png, storeLa/HawthroneHeights.png, storeLa/HolyBible.png,
storeLa/Fantasia.png, storeLa/Biology.png, storeLa/BigMommas.png,
storeLa/GeorgeWBushCenter.png, storeLa/MountainBike.png, storeLa/Footlocker.png,
storeLa/Vocaloid.png, storeLa/ASPCA.png, storeLa/Bungie.png, storeLa/HungerGames.png,
storeLa/VampiresEverywhere.png, storeLa/Tacori.png, storeLa/UnderArmour.png"; */




/*Faceboutique by Truc Le, 2014
 *Reference:
 *  Kosinski, M., Stillwell, D., & Graepel, T. (2013).
 *  Private traits and attributes are predictable from digital records of human behavior.
 *  Proceedings of the National Academy of Sciences of the United States of America , 110 (15), 5802-5.
 **/

Table table;
PFont title, body;
boolean active, done, shoulderHorizontal, shoulderVertical;
int xFig, yFig, yPost, totalValue, itemBought, checkOverlap;

String[] bag = new String[6];
boolean[] preInfoBoolean = new boolean[36];
boolean[] postInfoBoolean = new boolean[36];
PImage[] storeIm = new PImage[36];
PImage[] storeLa = new PImage[36];

RectClass rec = new RectClass();
PersonClass person;

void setup()
{  
  size(1280, 800);
  title=loadFont("KGDefyingGravity-48.vlw");
  body=loadFont("Opificio-48.vlw");
  table=loadTable("predictors.tsv");
  loadStoresImages();
  loadStoresLabels();
  reset();
  person = new PersonClass(xFig, yFig);

  shoulderVertical=true;
  shoulderHorizontal=false;

  active=false; 
  done=false;
}

void reset()
{
  checkOverlap=36;
  itemBought=0;
  totalValue=0;
  xFig=875;
  yFig=height/2;  
  for (int i=0; i<preInfoBoolean.length; i++)
  {
    preInfoBoolean[i]=false;
    postInfoBoolean[i]=false;
  }
}

void draw()
{ 
  //println("X: "+mouseX+" | Y: "+mouseY);

  if (active==true) {
    background(255, 248, 220);
    setShoulder();
    figure();
    row1();
    row2();
    row3();
    row4();
    row5();
    col1();
    feedback();

    pushStyle();
    strokeWeight(2);
    line(985, 400, 1225, 400);
    popStyle();

    displaypreInfoBoolean();
    displaypostInfoBoolean();

    //image boundary
    pushStyle();
    noFill();
    stroke(5);
    strokeWeight(2);
    rect(980, 100, 250, 250);
    popStyle();

    //saveFrame("z2-######.png");
  } 
  else {
    if (done==true) {
      endScreen();
      //saveFrame("z3-######.png");
    } 
    else {
      beginScreen();
      //saveFrame("z1-######.png");
    }
  }
}

/*
 *Begin state
 **/
void beginScreen()
{
  //background
  pushMatrix();
  pushStyle();
  noStroke();
  fill(255, 248, 220);
  rect(0, 0, width, height);
  popStyle();
  popMatrix();

  //Title
  pushMatrix();
  pushStyle();
  textFont(title);
  textAlign(CENTER);
  textSize(80);
  fill(0);
  text("[||FACEBOUTIQUE||]", width/2, 330);
  popStyle();
  popMatrix();

  //Body
  pushMatrix();
  pushStyle();
  textFont(body);
  textAlign(CENTER);
  textSize(28);
  fill(0);
  text("Welcome to Faceboutique !", width/2, 400);
  text("It’s a strip mall with a variety of products, special products, of course, that will", width/2, 430);
  text("help you learn about yourself.  So come, browse around, and hit                     to get the things you like !", width/2, 460);
  popStyle();
  popMatrix();

  //Begin statement
  pushMatrix();
  pushStyle();
  textFont(body);
  textAlign(CENTER);
  textSize(23);
  fill(0);
  text("Hit                         whenever you are ready.", width/2, 530);
  popStyle();
  popMatrix();

  //SPACE
  pushMatrix();
  pushStyle();
  textFont(title);
  textSize(31);
  fill(0);
  text("SPACE", 840, 460);
  text("SPACE", 492, 530);
  popStyle();
  popMatrix();
}

/*
 *End state
 **/
void endScreen()
{
  pushMatrix();
  frameRate(30);//for the darking out effect

  int yBag=330;

  //background
  pushStyle();
  fill(0, 10);
  rect(0, 0, width, height);
  popStyle();

  //overlap rect
  pushMatrix();
  pushStyle();
  rectMode(CENTER);
  noStroke();
  fill(255, 248, 220);
  rect(width/2, height/2, 680, height);
  popStyle();
  popMatrix();

  //title
  pushMatrix();
  pushStyle();
  textFont(title);
  textAlign(CENTER);
  textSize(60);
  fill(80);
  text("[||THANKS|FOR|SELLING|YOURSELF!||]", width/2, 120);
  popStyle();
  popMatrix();

  //intro text
  pushMatrix();
  pushStyle();
  textFont(body);
  textSize(25);
  fill(80);
  text("Thank you !", 400, 205);
  text("Your market value is:", 400, 230);
  text("You showed us that:* ", 400, 290);
  popStyle();
  popMatrix();

  //person's value
  pushMatrix();
  pushStyle();
  textFont(body);
  textSize(60);
  fill(80);
  text("$"+totalValue, 630, 230);
  popStyle();
  popMatrix();

  //items bought
  pushMatrix();
  pushStyle();
  textFont(body);
  textSize(40);
  fill(80);
  text(bag[0], 400, yBag);  
  text(bag[1], 400, yBag+40);
  text(bag[2], 400, yBag+80);
  text(bag[3], 400, yBag+120);
  text(bag[4], 400, yBag+160);
  text(bag[5], 400, yBag+200);
  popStyle();
  popMatrix();

  //sarcasm
  pushMatrix();
  pushStyle();
  textFont(body);
  textAlign(CENTER);
  textSize(23);
  fill(80);
  text("*We GUARANTEE to distribute these data", width/2, 590);//610
  text("to bring you even MORE advertisements", width/2, 615);
  text("of MORE similar products in the future.", width/2, 640);
  popStyle();
  popMatrix();

  //start again SPACE
  pushMatrix();
  pushStyle();
  textFont(title);
  textSize(25);
  fill(80);
  text("SPACE", width/2-57, 720);
  popStyle();
  popMatrix();

  //start again Text
  pushMatrix();
  pushStyle();
  textFont(body);
  textSize(20);
  fill(80);
  text("press", width/2-110, 720);
  text("to sell us more.", width/2, 720);
  popStyle();
  popMatrix();

  popMatrix();
}

/*-------------------ACTIVE STATE---------------------**/

/*
 *Draws the stores
 **/
void row1()
{
  pushStyle();
  strokeWeight(2);
  noFill();
  int xBox=103;
  int yBox=0;
  for (int i=0; i<8; i++)
  {
    image(storeLa[i], xBox, yBox, 103, 100);
    rec.makeRectangle(xBox, yBox, i);
    xBox+=103;
  }
}

void row2()
{
  int xBox=206;
  int yBox=250;
  for (int i=8; i<14; i++)
  {
    image(storeLa[i], xBox, yBox, 103, 100);
    rec.makeRectangle(xBox, yBox, i);
    xBox+=103;
  }
}

void row3()
{
  int xBox=309;
  int yBox=350;
  for (int i=14; i<16; i++)
  {
    image(storeLa[i], xBox, yBox, 103, 100);
    rec.makeRectangle(xBox, yBox, i);
    xBox+=309;
  }
}

void row4()
{
  int xBox=206;
  int yBox=450;
  for (int i=16; i<22; i++)
  {
    image(storeLa[i], xBox, yBox, 103, 100);
    rec.makeRectangle(xBox, yBox, i);
    xBox+=103;
  }
}

void row5()
{
  int xBox=103;
  int yBox=700;
  for (int i=22; i<30; i++)
  {
    image(storeLa[i], xBox, yBox, 103, 100);
    rec.makeRectangle(xBox, yBox, i);
    xBox+=103;
  }
}

void col1()
{
  int xBox=0;
  int yBox=100;
  for (int i=30; i<36; i++)
  {
    image(storeLa[i], xBox, yBox, 103, 100);
    rec.makeRectangle(xBox, yBox, i);
    yBox+=100;
  }
  popStyle();
}


/*
 *Consumer's history being updated during the game
 **/
void feedback()
{
  //    pushStyle();
  //    noStroke();
  //    fill(0, 50);
  //    rect(930, 0, 350, height);
  //    popStyle();

  //title of receipt
  pushMatrix();
  pushStyle();
  textAlign(CENTER);
  fill(0);
  textFont(title);
  text("[consumer|record]", 1105, 50);
  popStyle();
  popMatrix();
}

/*
 *Draws the person
 **/
void figure()
{
  pushStyle();
  strokeWeight(2);
  stroke(255, 248, 220);
  fill(55, 51, 48);
  ellipse(xFig, yFig, 36, 36); //head
  popStyle();
}
void setShoulder()
{
  if (shoulderVertical==true && shoulderHorizontal==false)
  {
    pushStyle();
    fill(55, 51, 48);
    ellipse(xFig, yFig, 18, 56); //shoulder Vertical
    popStyle();
  }
  else
  {
    pushStyle();
    fill(55, 51, 48);
    ellipse(xFig, yFig, 56, 18); //shoulder Horizontal
    popStyle();
  }
}


/*
 *Controls the person
 **/
void keyPressed()
{
  //all boundaries are calculated base on real-time running boundaries in println
  if (active==true)
  {
    if (key==CODED)
    {

      if (keyCode==LEFT)
      {
        shoulderVertical=true;
        shoulderHorizontal=false;
        if (xFig<=35)
        {
          xFig-=0;
        }
        else
        {
          xFig-=35;
        }
        person.updateLeft();
      }

      if (keyCode==RIGHT)
      {
        shoulderVertical=true;
        shoulderHorizontal=false;
        if (xFig>=870)
        {
          xFig+=0;
        }
        else
        {
          xFig+=35;
        }
        person.updateRight();
      }

      if (keyCode==UP)
      {
        shoulderVertical=false;
        shoulderHorizontal=true;
        if (yFig<=50)
        {
          yFig-=0;
        }
        else
        {
          yFig-=35;
        }
        person.updateUp();
      }

      if (keyCode==DOWN)
      {
        shoulderVertical=false;
        shoulderHorizontal=true;
        if (yFig>=750)
        {
          yFig+=0;
        }
        else
        {
          yFig+=35;
        }
        person.updateDown();
      }
      checkIntersection();
    }
    if (key==' ')
    {
      checkBuy();
    }
    //println("xFig: "+xFig+" yFig: "+yFig);
  }

  //Start & Start Again
  if (active==false) {
    if (key==' ')
    {
      active=true;
      reset();
      person.setCurrentX(xFig);
      person.setCurrentY(yFig);
    }
  }
}


/*
 *Check intersection
 **/
void checkIntersection()
{
  for (int i=0; i<36; i++)
  {
    if
      (person.getCurrentX()<=rec.getx2Coordinates(i) &&
      person.getCurrentX()>rec.getx1Coordinates(i) &&
      person.getCurrentY()<=rec.gety2Coordinates(i) &&
      person.getCurrentY()>rec.gety1Coordinates(i))
    {
      //println("in "+i+"th cell");
      setpreInfoBoolean(i);
    }
  }
}

/*
 *Boolean for displaying products' info
 **/
void setpreInfoBoolean(int j)
{
  for (int i=0; i<preInfoBoolean.length; i++)
  {
    preInfoBoolean[i]=false;
    preInfoBoolean[j]=true;
  }
}
void displaypreInfoBoolean()
{
  for (int i=0; i<preInfoBoolean.length; i++)
  {
    if (preInfoBoolean[i]==true)
    {
      pushMatrix();
      pushStyle();
      textFont(body);
      textAlign(CENTER);
      fill(0);
      textSize(22);
      text(table.getString(i, 3), 1105, 93);
      pushStyle();
      textSize(25);
      text(table.getString(i, 0), 1105, 390);
      popStyle();

      popStyle();
      popMatrix();
      image(storeIm[i], 980, 100, 250, 250);
    }
  }
}



/*
 *Check whether the player buys stuff
 **/
void checkBuy()
{
  for (int i=0; i<36; i++)
  {
    if
      (i!=checkOverlap &&
      person.getCurrentX()<=rec.getx2Coordinates(i) &&
      person.getCurrentX()>rec.getx1Coordinates(i) &&
      person.getCurrentY()<=rec.gety2Coordinates(i) &&
      person.getCurrentY()>rec.gety1Coordinates(i))
    {
      setpostInfoBoolean(i);
      checkOverlap=i;
    }
  }
}

/*
*Boolean for displaying consumer record (after purchase)
 **/
void setpostInfoBoolean(int j)
{
  itemBought++; 
  postInfoBoolean[j]=true;
  bag[itemBought-1]=table.getString(j, 1);
  totalValue+=table.getInt(j, 2); //ct to add up money whenever buy stuff, put in setter to execute once per purchase
  //println(totalValue);
}

void displaypostInfoBoolean()
{
  yPost=435;
  for (int i=0; i<postInfoBoolean.length; i++)
  {
    if (postInfoBoolean[i]==true)
    {
      pushMatrix();
      pushStyle();
      textFont(body);
      textSize(22);
      fill(0);

      //store's name
      text(table.getString(i, 0), 940, yPost);

      pushStyle();
      textSize(25);
      text("=> "+table.getString(i, 1), 940, yPost+25);
      popStyle();

      popStyle();
      popMatrix();
      yPost+=65;
    }
  }
  if (itemBought==6)
  {
    active=false;
    done=true;
  }
}

