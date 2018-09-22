Player player;

String path = "";//"infra-1-3000/infra-";
void setup() {
  size(960, 540);

  player = new Player(190, 108, path, 0);
}

void draw() {

  background(255);
  
  player.draw(0, 0);
}
