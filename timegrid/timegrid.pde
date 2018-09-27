Player[] players;
Player p1, p2;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.io.File;
import java.nio.file.*;

int pW;
int pH;

int dW = 5;
int dH = 5;

boolean isRecording = true;

String path = "infra-";

void setup() {
  size(1920, 1080);

  Path root = Paths.get(sketchPath(""));
  root = root.getParent().getParent();
  Path path1 = root.resolve("images/");
  
  path =  path1.toString();
  path +=  "/infra-";
  
  int total = dW * dH;
  pW = width / dW;
  pH = height / dH;
  int pace = 17000 / total;

  int[] index = new int[total];
  for (int i = 0; i < total; i ++) {
    index[i] = i;
  }
  shuffleArray(index);

  players = new Player[total];
  for (int i = 0; i < total; i ++) {
    int length = (int)random(15) + 10; 
    int v = index[i];

    Player player = new Player(pW, pH, path, index[i] * pace + 1, length);
    players[i] = player;
    println(i, v, (i%4) * pW, (i / 4) * pH);
  }
}

void draw() {

  background(255);

  for (int i = 0; i < players.length; i++) {
    players[i].draw((i%dW) * pW, (i /dH) * pH);
  }

  if (isRecording)
    saveFrame();
}
void shuffleArray(int[] ar)
{

  for (int i = ar.length - 1; i > 0; i--)
  {
    int index = (int)random(ar.length);
    // Simple swap
    int a = ar[index];
    ar[index] = ar[i];
    ar[i] = a;
  }
}
