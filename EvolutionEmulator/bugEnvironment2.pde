ArrayList bugs;
ArrayList foods;


void setup() {
  smooth();
  size(640, 480);
  bugs = new ArrayList();
  foods = new ArrayList();
  for (int i =0; i< 10; i++) {

    //                Xpos,               Ypos,         xsize, ysize,  Xspeed,     Yspeed,       xDirect,            yDirect,             DeathTime,       ReproduceThresh
    bugs.add(new Bug(i*random(20, 200), i*random(20, 200), 20, 20,  random(.3, 1.9), random(.3, 1.9), random(-.99, .99), random(-.99, .99),  random(50, 700), random (50,150)));
  }
  
  for (int i = 0; i< 60; i++){
  
    foods.add(new Food());
  
  }
  
}

void draw() {
  background(0);
  
  
  for (int i = foods.size()-1; i >= 0; i--){
   
    Food thisFood = (Food) foods.get(i);
    
    if (thisFood.isEaten == true){
    
      foods.remove(i);
    
    } else {
      
      thisFood.display();
    }
  }
  
  for (int i = bugs.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Bug bug = (Bug) bugs.get(i);
    
    bug.move();
    bug.shine();
    bug.eat();
    
    if (bug.lifeTimer < bug.timeToDie) {
      bug.live();
    }
    else {
      //bug.die();
      bugs.remove(i);
    }
    
    //reproduction     
    bug.tryToReproduce();
     
    if(bug.reproduce == true){
      
      bugs.add(new Bug (bug.xpos, bug.ypos, bug.xsize, bug.ysize, bug.xspeed, bug.yspeed, bug.xdirect, bug.ydirect, bug.timeToDie, bug.reproduceThresh));
      bugs.add(new Bug (bug.xpos, bug.ypos, bug.xsize, bug.ysize, bug.xspeed, bug.yspeed, bug.xdirect, bug.ydirect, bug.timeToDie, bug.reproduceThresh));
      bugs.remove(i);
  }
 

    
  }
}

void keyPressed() {
 
 if (key == 'f'){
  
   foods.add(new Food());
   
 } else if (key == 'b'){
  
   bugs.add(new Bug(random(20, 200), random(20, 200), 20, 20,  random(.3, 1.9), random(.3, 1.9), random(-.99, .99), random(-.99, .99),  random(50, 700), random (50,150))); 
 }
  
  
}



