import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];
int frAvg;

void setup() {
  frameRate(1000);
  size(512, 360);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);

  for(int i = 0; i < bands; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  line( i*width/bands, height, i*width/bands, height - spectrum[i]*height*5 );
    //print(i); // * 172.414
    //print(": ");
    //print(spectrum[i]);
    //print(",");
  } 
 
 if (spectrum[100] > .0002){
   background(255,0,0);
 }
 
 
  println(spectrum[100]);
  
}
