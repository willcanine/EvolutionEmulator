class Bug {

  //movement 
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float xdirect;
  float ydirect;
  
  //physical attributes
  float xsize;
  float ysize;
  float theta = random(-1, 1);

  //life cycle
  float lifeTimer = 0;
  float timeToDie;
  float reproduceThresh;
  
  //eat
  float foodCounter = 0;
  boolean reproduce;


Bug ( float tempXpos, float tempYpos, float tempxsize, float tempysize, float tempXspeed, float tempYspeed, float _xdirect, float _ydirect, float tempTime, float tempReproduceThresh) {

    xpos = tempXpos;
    ypos = tempYpos;

    xspeed = tempXspeed;
    yspeed = tempYspeed;
    
    xdirect = _xdirect + random(-3, 3);
    ydirect = _ydirect + random(-3, 3);

    xsize = tempxsize;
    ysize = tempysize;

    timeToDie= tempTime;
    reproduceThresh = tempReproduceThresh;
  }



void live() {
    lifeTimer = lifeTimer+1;
    ellipse(xpos, ypos, xsize, ysize);
    // foodCounter = foodCounter-1;
  }


//void die() {
//    xpos = (10*xpos) +(10* (noise(theta)*(1.5*sin(0.5*theta)*(xspeed/xspeed))));
//  }


void eat() {
  
  for (int i = foods.size()-1; i >= 0; i--){
   
    Food thisFood = (Food) foods.get(i);  
    
    if (xpos < (thisFood.xpos + 10) && xpos > (thisFood.xpos - 10) && ypos < (thisFood.ypos + 10) && ypos > (thisFood.ypos - 10)){
    
    foodCounter = foodCounter + thisFood.size;
    lifeTimer = lifeTimer - thisFood.size;
    thisFood.isEaten = true;
    
    }
  }
}


void tryToReproduce() {

    if (foodCounter> reproduceThresh ) {
      reproduce = true;
    }
    else {
      reproduce = false;
    }
    
  }


void move() {
    
    

    xpos = xpos + (xspeed*xdirect); 
    ypos = ypos + (yspeed*ydirect);
    
    if ((xpos  < 0) || (xpos > width)){
     
      xspeed = xspeed * -1;
      
    }
    
    if ((ypos  < 0) || (ypos > height)){
     
      yspeed = yspeed * -1;
      
    }
    
  for (int i = bugs.size()-1; i >= 0; i--) { 
    
    Bug bug = (Bug) bugs.get(i);
    
    //if ( xpos < (bug.xpos + 10) && xpos > (bug.xpos - 10)) {
    if (xpos == bug.xpos){
     
      xdirect = bug.xdirect;
       ydirect = bug.ydirect; 
      
    } 
         
  }
    
  }


void shine() {

  float angle;
  angle = 2*PI;

  angle += random(0.02, 0.05);
  fill (0+255*sin(angle), 60+195*sin(angle), 120);

}

}
