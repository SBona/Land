class Path
{
  private ArrayList<PVector> path;

  public Path(int x,int y)
  {
    path = new ArrayList<PVector>();
    path.add(new PVector(x,y));
  }

  public void addVertex(PVector v)
  {
    path.add(v);
  }
  public int length()
  {
    return path.size();
  }
  public void draw()
  {
    stroke(200,0,0);
    strokeWeight(1);
    noFill();
    beginShape();
    for(PVector p: path)
    {
      curveVertex(p.x,p.y);
    }
    endShape();
  }
}