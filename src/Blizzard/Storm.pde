// Emil Gruenwald

class Storm {
  // Member variables
  int progressX, intensity;
  ArrayList<PVector> particles = new ArrayList<PVector>();
  // PImage storm;

  // Constructor
  Storm() {
    progressX = 0;
    intensity = 0;
    
    for (int i = 0; i < 2000; i ++) {
      particles.add(new PVector(random(width), random(height), random(3,8)));
    }
  }

  // Member Methods
  void display () {
    fill(255, 200);
    for (int i = 0; i < particles.size(); i ++) {
      rect(particles.get(i).x, particles.get(i).y, particles.get(i).z, particles.get(i).z);
    }
  }
  
  void update (int xOffset, int yOffset) {
    for (int i = 0; i < particles.size(); i ++) {
      particles.get(i).x += 6 + random(2) + xOffset; 
      particles.get(i).y += 6 + random(2) + yOffset;
      
      if (particles.get(i).x > width) {
        particles.get(i).x  = 0;
      }
      
      if (particles.get(i).y > height) {
        particles.get(i).y  = 0;
      }
    }
  }
  
  void encounter () {
  }
}
