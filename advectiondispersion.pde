int radius = 5;

int cols = 150;
int rows = 150;
float[][] K = new float[cols][rows];


void setup(){
 size(900,900);

 K[50][0]=800; //Initial Concentration
 
}


void draw(){
                      
  background(25); //<>//
  
  float Dx = random(0.01,0.3); //Dispersion X-direction
  float Dy = random(0.01,0.3); //Dispersion Y-direction
  float vx = random(0.005,0.05); //advection X-direction
  float vy = random(0.05,0.3); //advection Y-direction
  float k = 0.005; //Decay
  
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
   
      float x = Dx*(K[j+1][i]-(2*K[j][i])+K[j-1][i])+Dy*(K[j][i+1]-(2*K[j][i])+K[j][i-1])+K[j][i]-vx*(K[j+1][i]-K[j-1][i])-vy*(K[j][i+1]-K[j][i-1])-k*K[i][j];
      K[j][i] = x;
      noStroke();
            
      float b = map(K[j][i], 0,20, 0, 255);
      fill(0,0,255,b);
      ellipse(7*i, 7*j, radius, radius);   
    }
  }


}