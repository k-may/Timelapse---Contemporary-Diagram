import java.nio.file.Paths;
import java.nio.file.Path;
import java.io.File;
import java.nio.file.*;

Player[] players;
Player p1, p2;
int pW;
int pH;

int dW = 5;
int dH = 5;

boolean isRecording = true;

String path = "/infra-";

void setup() {
  size(1920, 1080);
  
  smooth();
  
  String sketchPath = sketchPath("");

  players = new Player[8];
  Path root = Paths.get(sketchPath);
  root = root.getParent().getParent();
  Path path1 = root.resolve("images/");
  
  String p =  path1.toString();
  p += path;

  for (int i=0; i < 8; i ++) {
   int index = i * 17000/8 + 1;
    Player player = new Player(width/8, height, p, index, 20);
    players[i] = player;
  }
}

void draw() {

  background(255);

  for (int i = 0; i < players.length; i++) {
    players[i].draw(i * int((float)width/8), 0, PI/2);
  }

  //players[0].draw(0, 0, PI/2);

  if (isRecording)
    saveFrame();
}
