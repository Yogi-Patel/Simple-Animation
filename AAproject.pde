Animation animation;
float y = 500;
int quantity = 300;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;
float t;
int choice = 1; 
void setup()
{
  size(1012,712);
  frameRate(30);
  smooth();
  
  PImage[] seq = new PImage[15];
  for(int i = 0; i< seq.length; i++)
  {
    seq[i] = loadImage(i+".png");
    seq[i].resize(128+100,94+100);
  }
  
  animation = new Animation(seq,width/2,height/2);
  
  for(int i = 0; i < quantity; i++) 
  {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
}

void draw()
{
  
  switch(choice)
  {
   case 1:  background(20);
            stroke((int)random(255),(int)random(255),(int)random(255)) ;
            strokeWeight(5);
            translate(width/2 , height/2);
            for(int i = 0;i<=10;i++)
            {
              line(x1(t+i) , y1(t+i),x2(t+i) , y2(t+i));
              stroke((int)random(255),(int)random(255),(int)random(255)) ;
            }
  
            t++;
            break;
            
   case 2:  background(255,0,0);
            noStroke();
            animation.display();
            animation.next();
            animation.move();
  
            for(int i = 0; i < xPosition.length; i++) 
            {
              ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    
              if(direction[i] == 0) 
              {
                xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
              } 
              else 
              {
                xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
              }
    
              yPosition[i] += flakeSize[i] + direction[i]; 
    
              if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) 
              {
                xPosition[i] = random(0, width);
                yPosition[i] = -flakeSize[i];
              }
    
           }
           break;
  }
  
}

float x1( float t)
{
  return (sin(t/10)*100 + sin(t/5)*20) ; 
}

float y1( float t)
{
  return cos(t/10)*100  ;
}

float x2( float t)
{
  return sin(t/10)*200 + sin(t)*2 ; 
}

float y2( float t)
{
  return cos(t/20)*200 + cos(t/12)*20  ;
}

void mouseClicked()
{
  choice++;
  if(choice >=3)
  {
    choice = 1;
  }
}
