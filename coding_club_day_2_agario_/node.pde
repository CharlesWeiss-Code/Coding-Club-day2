public class Node {
  PVector pos;
  color c;
  float r;
  PVector vel;
  boolean clipping = false;
  float area;
  public Node(PVector pos, color c, float r, PVector vel) {
    this.pos = pos;
    this.c = c;
    this.r = r;
    this.vel = vel.setMag(5);
    area = PI*pow(r,2);
  }

  public void show() {
    fill(c, 100);
    ellipse(pos.x, pos.y, 2*r, 2*r);
  }

  public void update() {
    r = sqrt(area/PI);
    
    pos.x+=vel.x;
    pos.y+=vel.y;

    if (pos.x+r > width || pos.x-r < 0) {
      vel.x*=-1;
    }
    if (pos.y+r > height || pos.y-r < 0) {
      vel.y*=-1;
    }
  }


  public void checkCollision() {

    // because we are removing things from an ArrayList, we must ITERATE BACKWARS.
    // start at index being high and end index being low.
    // now everything must iterate BACKWARDS.

    for (int i = nodes.size()-1; i >= 0; i--) {
      Node n = nodes.get(i);
      if (!n.equals(this)) {
        if (dist(n.pos.x, n.pos.y, this.pos.x, this.pos.y) < (n.r+this.r)) {
          if (n.r > this.r) {
            n.area+=this.area;
            nodes.remove(this);
            break;
          } else {
            this.area+=n.area;
            nodes.remove(n);
            break;
          }
        }
      }
    }
  }
}
