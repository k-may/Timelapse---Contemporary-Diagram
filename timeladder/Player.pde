class Player {

  int w;
  int h;
  PGraphics buffer;

  int pace = 1;
  int currentIndex = 1;
  int nextIndex = 1;
  int lengthImage = 12;

  float scaleAmt = 0;//.03;
  float scale = 1;

  PImage startImage;
  PImage endImage;

  int counter = 0;

  String path;
  int frameStart;

  Player(int wi, int hi, String p, int fS, int lI) {
    w = wi;
    h = hi;
    frameStart  = 17000;
    lengthImage = 10;//lI;

    path = p;
    currentIndex = nextIndex = fS;
    buffer = createGraphics(w, h);

    updateImages();
  }

  void draw(int x, int y, float rotation) {
    counter ++; 

    int index = floor(counter / lengthImage);

    if (currentIndex != index) {
      updateImages();
    }
    float fadeIn = (counter - floor(currentIndex * lengthImage)) / (float)lengthImage;

    buffer.beginDraw();
    buffer.pushMatrix();
    buffer.rotate(PI/2);

    int xO = -180;
    int yO = -500;
    float scale =  1.7;
    int wO =(int)( buffer.height * scale);
    int hO = (int)(buffer.height * (endImage.width / endImage.height) * scale);

    buffer.tint(255, 255);
    buffer.image(startImage, xO, yO, wO, hO);

    buffer.tint(255, fadeIn * 255);
    buffer.image(endImage, xO, yO, wO, hO); 

    buffer.popMatrix();
    buffer.endDraw();

    image(buffer, x, y, w, h);
  }

  void updateImages() {

    currentIndex = nextIndex;
    nextIndex = currentIndex + pace;
    counter = currentIndex * lengthImage;

    //println("-->" + currentIndex);

    //only load two images at a time;
    if (endImage != null) {
      startImage = endImage;
    } else {
      startImage = loadImage(path +  String.format("%05d", currentIndex) + ".jpg");
    }

    endImage = loadImage(path +  String.format("%05d", nextIndex) + ".jpg");
  }
}
