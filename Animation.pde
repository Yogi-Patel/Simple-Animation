class Animation
{
  float x;
  float y; 
  float index = 0 ;  
  float speed;
  PImage[] images;
  Animation(PImage[] images_, float x_, float y_)
  {
    images = images_;
    x = x_;
    y = y_;
    speed = 0.25;
  }
  
  void display()
  {
    imageMode(CENTER);
    int imageIndex = int(index);
    image(images[imageIndex], x, y);
  }
  
  void move()
  {
    x += speed*10;
    if(x>width)
    {
      x = -images[0].width;
    }
  }
  
  void next()
  {
    index += speed;
    if(index >= images.length)
    {
      index -= images.length;
    }
  }
}
