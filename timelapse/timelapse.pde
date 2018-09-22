
String path = "infra-1-3000/infra-";

int frameOrigStart = 0;
int numFramesOrig = 10;
int numFramesTotal = 10;
int pace = 4;
int currentIndex = 0;
int lengthImage = 25;

float scaleAmt = 0.03;
float scale = 1;

PImage startImage;
PImage endImage;

int counter = 0;

boolean isRecording = true;

void setup() {
  size(1920, 1080);
  frameRate(25);
  updateImages();
}


void draw() {

  background(255);
  counter ++;

  //int count = frameCount;// % (numFramesOrig * lengthImage);
  int index = floor(counter / lengthImage);

  if (currentIndex != index) {
    counter += pace * lengthImage;
    currentIndex = index + pace;
    updateImages();
  }

  if (currentIndex < numFramesOrig - 1) {

    float fadeIn = (counter - floor(currentIndex * lengthImage)) / (float)lengthImage;

    float scaleOut = scale - scaleAmt + fadeIn * scaleAmt;
    float scaleIn = scale + fadeIn * scaleAmt;

    int w = width;// / 2;
    int h = height;

    tint(255, 255);
    image(startImage, (w - w * scaleIn)/2, (h - h * scaleIn)/2, w * scaleIn, h * scaleIn);

    tint(255, fadeIn* 255);
    image(endImage, (w - w * scaleOut)/2, (h - h * scaleOut)/2, w * scaleOut, h * scaleOut);

    if (isRecording)
      saveFrame();
      
  } else
    exit();
}

void updateImages() {

  println("-->" + currentIndex);

  //only load two images at a time;
  if (endImage != null) {
    startImage = endImage;
  } else {
    startImage = loadImage(path + String.format("%05d", currentIndex + frameOrigStart + 1) + ".jpg");
  }

  endImage = loadImage(path + String.format("%05d", currentIndex + frameOrigStart + 2) + ".jpg");
}
