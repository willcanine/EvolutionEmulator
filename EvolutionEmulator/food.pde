class Food {
  
  float xpos;
  float ypos; 
  float size;
  
  float speed;
  float xDirect;
  float yDirect;
  
  boolean isEaten = false;
  
  Food (){
    
    xpos = random (0, width);
    ypos = random (0, height);
    size = random (5, 17);    
    
    speed = .09;
    xDirect = random (-.9, .9);
    yDirect = random (-.9, .9);
    
  }
  
  void display (){
   
   fill(#E01B6A); 
   
   xpos = xpos + (speed*xDirect);
   ypos = ypos + (speed*yDirect);
   
   ellipse(xpos, ypos, size, size); 
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
