/*
 *Rectangle Class to create arrays of stores
 **/

class RectClass
{
  int[] storeCount = new int[36];
  int[] x1Coordinates = new int[36];
  int[] x2Coordinates = new int[36];
  int[] y1Coordinates = new int[36];
  int[] y2Coordinates = new int[36];

  public RectClass()
  {
  }

  public void makeRectangle(int x, int y, int storeCount)
  {
    rect(x, y, 103, 100);

    setx1Coordinates(storeCount, x);
    setx2Coordinates(storeCount, x+103);
    sety1Coordinates(storeCount, y);
    sety2Coordinates(storeCount, y+100);

    //println("storeCount: "+storeCount+" x:"+x+" y:"+y);
  }


  /*
   *Store values of 4 boundaries of each store
   **/
  public void setx1Coordinates(int newstoreCount, int newX1)
  {
    this.x1Coordinates[newstoreCount]=newX1;
  }
  public void setx2Coordinates(int newstoreCount, int newX2)
  {
    this.x2Coordinates[newstoreCount]=newX2;
  }
  public void sety1Coordinates(int newstoreCount, int newY1)
  {
    this.y1Coordinates[newstoreCount]=newY1;
  }
  public void sety2Coordinates(int newstoreCount, int newY2)
  {
    this.y2Coordinates[newstoreCount]=newY2;
  }


  /*
   *Return values of 4 boundaries of each store
   **/
  public int getx1Coordinates(int i)
  {
    return x1Coordinates[i];
  }

  public int getx2Coordinates(int i)
  {
    return x2Coordinates[i];
  }

  public int gety1Coordinates(int i)
  {
    return y1Coordinates[i];
  }

  public int gety2Coordinates(int i)
  {
    return y2Coordinates[i];
  }
}

