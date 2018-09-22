
String path = "Archive (1)/infra-";

int numFramesOrig = 3000;

int pace = 1;
int currentIndex = 1;
int nextIndex = 1;
int lengthImage = 12;

float scaleAmt = 0;//.03;
float scale = 1;

PImage startImage;
PImage endImage;

int counter = 0;

boolean isRecording = false;

void setup() {
  //size(3840, 2160);
  size(1920, 1080);
  frameRate(25);

  //set start position
  currentIndex = nextIndex = 17051;

  updateImages();
}


void draw() {

  background(255);
  counter ++;

  int index = floor(counter / lengthImage);

  if (currentIndex != index) {
    updateImages();
  }

   //just let it crash...

  float fadeIn = (counter - floor(currentIndex * lengthImage)) / (float)lengthImage;

  float scaleOut = scale - scaleAmt + fadeIn * scaleAmt;
  float scaleIn = scale + fadeIn * scaleAmt;

  float aspect = 3000/4000;

  float w = width * scaleIn;// / 2;
  float h =height * 4/3;
  float x =  (width - w)/2;
  float y = (height - h)/2;

 // println(h, height * 3/4);
  tint(255, 255);
  image(startImage, x, y, w, h);

  tint(255, fadeIn * 255);
  image(endImage, x, y, w, h);

  if (isRecording)
    saveFrame();

  //} else
  //exit();
}

void updateImages() {

  currentIndex = nextIndex;
  nextIndex = currentIndex + pace;
  counter = currentIndex * lengthImage;

  println("-->" + currentIndex);

  //only load two images at a time;
  if (endImage != null) {
    startImage = endImage;
  } else {
    startImage = loadImage(path + String.format("%05d", currentIndex) + ".JPG");
  }

  endImage = loadImage(path + String.format("%05d", nextIndex) + ".JPG");
}
