class Plane
{

  private PVector loc;
  private PVector vel;
  private Path myPath;
  private final float MAINVAR = .2;
  private final float SECONDVAR = .12;

  public Plane()
  {
    int side = (int) random(4);
    switch (side)
    {
    case 0: 
      loc = new PVector(random(width), 0);
      vel = new PVector(random(-SECONDVAR,SECONDVAR),random(SECONDVAR,MAINVAR));
      break;
    case 1: 
      loc = new PVector(width, random(height));
      vel = new PVector(random(-MAINVAR,SECONDVAR),random(-SECONDVAR,SECONDVAR));
      break;
    case 2:
      loc = new PVector(random(width), height);
      vel = new PVector(random(-SECONDVAR,SECONDVAR),random(SECONDVAR,MAINVAR));
      break;
    case 3:
      loc = new PVector(0, random(height));
      vel = new PVector(random(SECONDVAR,MAINVAR),random(-MAINVAR,MAINVAR));
      break;
    }
  }
  
  public Plane(PVector loc, PVector vel) {
    this.vel = vel;
    this.loc = loc;
  }

  public void draw()
  {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(0);
    stroke(0);
    strokeWeight(2);
    line(0, 0, 5*vel.normalize().x, 5*vel.normalize().y);
    ellipse(0, 0, 3, 3);
    popMatrix();
  }
  public void update()
  {
    loc.x += vel.x/5;
    loc.y += vel.y/5;
  }
  public void setPath(Path p)
  {
    myPath = p;
  }
  public float x()
  {
    return loc.x;
  }
  public float y()
  {
    return loc.y;
  }
}