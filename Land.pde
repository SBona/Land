ArrayList<Plane> planes;
Path currentPath; //current temp path for when its being created
Plane currentPathPlane; //current plane for which a path is being made

void setup()
{
  size(900, 600);
  planes = new ArrayList<Plane>();

  for (int i = 0; i < 50; i++)
  {
    planes.add(new Plane());
  }
  currentPath = null;
  currentPathPlane = null;
}

void draw()
{
  background(255);

  for ( Plane p : planes)
  {
    p.update();
    p.draw();
  }
  if (currentPath != null)
  {
    currentPath.draw();
    if(currentPath.length() > 2000)
    {
      currentPath = null;
      currentPathPlane = null;
    }
  }
}

void mousePressed()
{
  //planes.add(new Plane());
  for (Plane p : planes)
  {
    if (dist(p.x(), p.y(), mouseX, mouseY) < 5)
    {
      currentPath = new Path(mouseX, mouseY);
      currentPathPlane = p;
    }
  }
}
void mouseDragged()
{
  if (currentPath != null)
  {
    currentPath.addVertex(new PVector(mouseX, mouseY));
  }
}

void mouseReleased()
{
  //check if it would land the plane


  if (currentPath != null)
  {
    currentPathPlane.setPath(currentPath); //set the temp path to the temp plane then clear temp variables
    currentPathPlane = null;
    currentPath = null;
  }
}