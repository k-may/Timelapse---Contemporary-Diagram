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

  Player(int wi, int hi, String p, int fS) {
    w = wi;
    h = hi;
    path = p;
    frameStart = fS;
    buffer = createGraphics(w, h);

    updateImages();
  }

  void draw(int x, int y) {
    counter ++;

    int index = floor(counter / lengthImage);

    if (currentIndex != index) {
      updateImages();
    }
    float fadeIn = (counter - floor(currentIndex * lengthImage)) / (float)lengthImage;

    buffer.beginDraw();
    buffer.tint(255, 255);
    buffer.image(startImage, x, y, w, h);

    buffer.tint(255, fadeIn * 255);
    buffer.image(endImage, x, y, w, h); 
    buffer.endDraw();

    image(buffer, x, y, w, h);
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
      startImage = loadImage(path +currentIndex + ".JPG");// String.format("%05d", currentIndex) + ".JPG");
    }

    endImage = loadImage(path + nextIndex + ".JPG");//String.format("%05d", nextIndex) + ".JPG");
  }
}
