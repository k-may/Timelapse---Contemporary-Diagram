Player[] players;
Player p1, p2;
int pW;
int pH;

String path = "infra-";//"infra-1-3000/infra-";
void setup() {
  size(960, 540);

  pW = width / 4;
  pH = height / 4;
  int pace = 17000 / 16;
  
  players = new Player[16];
  for(int i = 0; i < 16; i ++){
    Player p = new Player(pW, pH, path, i * pace + 1);
    players[i] = p;
    prinln(i, (i%4) * pW, (i / 4) * pH);
  }

}

void draw() {

  background(255);

  for(int i = 0; i < players.length; i++){
   players[i].draw((i%4) * pW, (i / 4) * pH);
   }

}
