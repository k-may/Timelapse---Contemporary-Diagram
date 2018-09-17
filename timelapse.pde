PImage[] images;
String[] paths = new String[]{
  "G0010474.JPG", 
  "G0010475.JPG", 
  "G0010476.JPG", 
  "G0010477.JPG", 
  "G0010478.JPG", 
  "G0010479.JPG", 
};
int currentIndex = 0;
int lengthImage = 40;
boolean isRecording = true;

void setup() {
  size(800, 600);

  images = new PImage[paths.length];

  for (int i = 0; i < paths.length; i ++) {
    images[i] = loadImage(paths[i]);
  }
}


void draw() {

  background(255);

  if (frameCount < images.length * lengthImage) {
    int count = frameCount % (images.length * lengthImage);

    currentIndex = floor(count / lengthImage);

    //print(count, currentIndex);

    float fadeIn = (count - floor(currentIndex * lengthImage)) / (float)lengthImage;
    float fadeOut = 1.0 - fadeIn;

    PImage startImage = images[currentIndex];
    PImage endImage = images[(currentIndex + 1) % images.length];

    float scale = 1;
    float scaleOut = scale;// - 0.1 + fadeIn * 0.1;
    float scaleIn = scale;// + fadeIn * 0.1;
    
    int w = width;// / 2;
    int h = height;
    
    // tint(255, pow(fadeOut, 2) * 255);
    tint(255, 255);
    image(startImage, (w - w * scaleIn)/2, (h - h * scaleIn)/2, w * scaleIn, h * scaleIn);

    tint(255, fadeIn* 255);
    image(endImage,(w - w * scaleOut)/2, (h - h * scaleOut)/2, w * scaleOut, h * scaleOut);
    
    if(isRecording)
      saveFrame();
  }else
    exit();
}
