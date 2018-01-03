int radius = 5; //dot radius

int cols = 150;
int rows = 150;
float[][] K = new float[cols][rows];


void setup(){
  size(700,700);
  frameRate(12);
  
}

void draw(){
                      
  background(25); //<>//
  
  float a = 0.2; //Dispersion Y-direction
  float b = 0.2; //Dispersion X-direction
  float c = random(0.08,0.09); //advection Y-direction
  float d = random(0.08,0.2); //advection X-direction
  float k = 0.005; //Substance Reaction
  
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
     
      K[15][0]=1000; //Initial Concentration source
      
      float x = a*(K[j+1][i]-(2*K[j][i])+K[j-1][i])+b*(K[j][i+1]-(2*K[j][i])+K[j][i-1])+K[j][i]-c*(K[j+1][i]-K[j-1][i])-d*(K[j][i+1]-K[j][i-1])-k*K[i][j];
      K[j][i] = x;
      
      noStroke();
            
      float intensity = map(K[j][i], 0, 20, 0, 255); //mapping the concentration to color intensity
      fill(0,0,255,intensity);
      ellipse(7*i, 7*j, radius, radius);   
      
    }
  }

}