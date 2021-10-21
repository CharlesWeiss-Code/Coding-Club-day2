
int nodeCount = 50;
ArrayList<Node> nodes = new ArrayList<Node>();

public void setup() {
  fullScreen();
  createNodes();
}

public void draw() {
  background(51);
  updateNodes();
  showNodes();

}


public void createNodes() {
  for (int i = 0; i < nodeCount; i++) {
    color c = color((int)random(255), (int)random(255), (int)random(255));
    float r = random(0, 25);
    float velx = random(-1, 1);
    float vely = random(-1, 1);
    PVector vel = new PVector(velx, vely);
    PVector pos = new PVector(random(2*r,width-2*r), random(2*r,height-2*r));
    nodes.add( new Node(pos, c, r, vel));
  }
}


public void showNodes() {
  for (int i = nodes.size()-1; i >= 0; i--) {
    nodes.get(i).show();
  }
}

public void updateNodes() {
  for (int i = nodes.size()-1; i >= 0; i--) {
    nodes.get(i).update();
  }
  for (int i = nodes.size()-1; i >= 0; i--) {
    nodes.get(i).checkCollision();
  }
}
