/*
 *PersonClass to check person's position
 **/
class PersonClass {

  private int currentX;
  private int currentY;
  private RectClass rec = new RectClass();

  public PersonClass(int x, int y)
  {
    setCurrentX(x);
    setCurrentY(y);
  }


  /*
   *Always moves 35 pixels in any direction
   **/
  public void updateLeft()
  {
    if (currentX<=35)
    {
      this.currentX-=0;
    }
    else
    {
      this.currentX-=35;
    }
  }

  public void updateRight()
  {
    if (currentX>=870)
    {
      this.currentX+=0;
    }
    else
    {
      this.currentX+=35;
    }
  }

  public void updateUp()
  {
    if (currentY<=50)
    {
      this.currentY-=0;
    }
    else
    {
      this.currentY-=35;
    }
  }

  public void updateDown()
  {
    if (currentY>=750)
    {
      this.currentY+=0;
    }
    else
    {
      this.currentY+=35;
    }
  }


  /*
   *Set x, y coordinates of the person
   **/
  public void setCurrentX(int x)
  {
    this.currentX=x;
  }
  public void setCurrentY(int y)
  {
    this.currentY=y;
  }

  /*
   *Return x, y coordinates of the person
   **/
  public int getCurrentX()
  {
    return currentX;
  }

  public int getCurrentY()
  {
    return currentY;
  }
}

