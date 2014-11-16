// initialze score variable
PImage monster;
PImage over;
PImage start;
int level=0;




int score;//
float monsterSize= 50;
float[] monsterx=new float[10];
float[] monstery=new float[10];
float[] speed=new float[10];
boolean fire= false;

float cannonx;


// game viariable;
int gameOver=0;

// game started




void setup() {
  size(600, 600);
  monster=loadImage("monster1.png");
   over=loadImage("gameover.png");
   start=loadImage("gamestart.png");

  for (int i=0; i<10  ;i++) { 
    monsterx[i]=random(0, width);
    monstery[i]=random(0, height/2);
    speed[i]=random(0.5, 3);
  }
}


void draw() {
    if (level==0){
    
   image(start,0,0,width,height); 
      if(keyPressed){
        level=1;
      }  
}
  
  
  if (level==1) {
    background(253, 210, 10);//yellow
    for (int i=0; i<10;i++) {

      image(monster, monsterx[i], monstery[i], monsterSize, monsterSize);
      monstery[i]=monstery[i]+speed[i];


      //ellipse(monsterx[i],monstery[i],10,10);
    }

    fill(250, 3, 73);
    noStroke();
    cannonx=mouseX;
    rectMode(CENTER);
    rect(cannonx, 550, 20, 30);

    //display score
    fill(0);
    text(score, 20, 20);

    if (mousePressed) {
      stroke(39, 154, 240);
      line(cannonx, 550-10, cannonx, 0);

      for ( int i=0;i<10;i++) {
        if ( mouseX>=monsterx[i]&&mouseX<=monsterx[i]+50) {
          monsterx[i]=-50;
          score++;
        }
      }
    }
    for (int i=0;i<10;i++) {
      if ((monstery[i]>=height && monsterx[i]>=0)||score==10 ) {
        level=2;
        
       
      }
    }
  }//end of level one
  
  if (level==2){
    
   image(over,0,0,width,height); 
  }
  
}//end of the draw 

