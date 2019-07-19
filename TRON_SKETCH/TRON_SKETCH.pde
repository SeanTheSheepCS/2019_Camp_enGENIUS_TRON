int[][] grid = new int[80][80];
int redBikeRow = 78;
int redBikeCol = 79;
int blueBikeRow = 0;
int blueBikeCol = 0;
int redBikeDir = 0;
int blueBikeDir = 1;
boolean hasGameStarted = false;
boolean hasGameEnded = false;

void setup()
{
  size(800, 900);
  for (int counter = 0; counter < 81; counter++)
  {
    stroke(255,255,255);
    line((counter*10), 0, (counter*10), 800);
    line(0, (counter*10), 800, (counter*10));
  }
  for (int counter = 0; counter < 80; counter++)
  {
    for (int counterTwo = 0; counterTwo < 80; counterTwo++)
    {
      grid[counter][counterTwo] = 0;
    }
  }
}

void draw()
{
  if(hasGameEnded)
  {
    return;
  }
  if(keyCode == ENTER)
  {
    hasGameStarted = true;
  }
  if(hasGameStarted == false)
  {
    image(loadImage("Tron_CoverArt.jpg"),0,0,800,900);
    textSize(32);
    fill(0,0,0);
    text("PRESS ENTER TO BEGIN",200,700);
    return;
  }
  for (int counter = 0; counter < 80; counter++)
  {
    for (int counterTwo = 0; counterTwo < 80; counterTwo++)
    {
      if(grid[counter][counterTwo] == 0)
      {
        fill(0,0,0);
      }
      else if(grid[counter][counterTwo] == 1)
      {
        fill(255,0,0);
      }
      else if(grid[counter][counterTwo] == 2)
      {
        fill(0,0,255);
      }
      else if(grid[counter][counterTwo] == 3)
      {
        fill(255,105,180);
      }
      else if(grid[counter][counterTwo] == 4)
      {
        fill(230,0,250);
      }
      rect((counterTwo*10),(counter*10),40,40);
    }
  }
  if(keyCode == DOWN)
  {
    redBikeDir = 1;
  }
  if(keyCode == UP)
  {
    redBikeDir = 0;
  }
  if(keyCode == LEFT)
  {
    redBikeDir = 3;
  }
  if(keyCode == RIGHT)
  {
    redBikeDir = 2;
  }
  
  
  if(redBikeDir == 1)
  {
    grid[redBikeRow][redBikeCol] = 1;
    redBikeRow++;
    if(redBikeRow == 80)
    {
      redBikeRow = 0;
    }
    if(grid[redBikeRow][redBikeCol] == 2)
    {
      blueWins();
    }
    grid[redBikeRow][redBikeCol] = 3;
  }
  if(redBikeDir == 0)
  {
    grid[redBikeRow][redBikeCol] = 1;
    redBikeRow--;
    if(redBikeRow == -1)
    {
      redBikeRow = 79;
    }
    if(grid[redBikeRow][redBikeCol] == 2)
    {
      blueWins();
    }
    grid[redBikeRow][redBikeCol] = 3;
  }
  if(redBikeDir == 3)
  {
    grid[redBikeRow][redBikeCol] = 1;
    redBikeCol--;
    if(redBikeCol == -1)
    {
      redBikeCol = 79;
    }
    if(grid[redBikeRow][redBikeCol] == 2)
    {
      blueWins();
    }
    grid[redBikeRow][redBikeCol] = 3;
  }
  if(redBikeDir == 2)
  {
    grid[redBikeRow][redBikeCol] = 1;
    redBikeCol++;
    if(redBikeCol == 80)
    {
      redBikeCol = 0;
    }
    if(grid[redBikeRow][redBikeCol] == 2)
    {
      blueWins();
    }
    grid[redBikeRow][redBikeCol] = 3;
  }
  
  if(key == 's')
  {
    blueBikeDir = 1;
  }
  if(key == 'w')
  {
    blueBikeDir = 0;
  }
  if(key == 'a')
  {
    blueBikeDir = 3;
  }
  if(key == 'd')
  {
    blueBikeDir = 2;
  }
  
  if(blueBikeDir == 0)
  {
    grid[blueBikeRow][blueBikeCol] = 2;
    blueBikeRow--;
    if(blueBikeRow == -1)
    {
      blueBikeRow = 79;
    }
    if(grid[blueBikeRow][blueBikeCol] == 1)
    {
      redWins();
    }
    grid[blueBikeRow][blueBikeCol] = 4;
  }
  if(blueBikeDir == 1)
  {
    grid[blueBikeRow][blueBikeCol] = 2;
    blueBikeRow++;
    if(blueBikeRow == 80)
    {
      blueBikeRow = 0;
    }
    if(grid[blueBikeRow][blueBikeCol] == 1)
    {
      redWins();
    }
    grid[blueBikeRow][blueBikeCol] = 4;
  }
  if(blueBikeDir == 2)
  {
    grid[blueBikeRow][blueBikeCol] = 2;
    blueBikeCol++;
    if(blueBikeCol == 80)
    {
      blueBikeCol = 0;
    }
    if(grid[blueBikeRow][blueBikeCol] == 1)
    {
      redWins();
    }
    grid[blueBikeRow][blueBikeCol] = 4;
  }
  if(blueBikeDir == 3)
  {
    grid[blueBikeRow][blueBikeCol] = 2;
    blueBikeCol--;
    if(blueBikeCol == -1)
    {
      blueBikeCol = 79;
    }
    if(grid[blueBikeRow][blueBikeCol] == 1)
    {
      redWins();
    }
    grid[blueBikeRow][blueBikeCol] = 4;
  }
  
}

void redWins()
{
  fill(255,255,255);
  rect(250,325,300,100);
  textSize(60);
  fill(200,44,44);
  text("Red wins!",275,400);
  hasGameEnded = true;
}

void blueWins()
{
  fill(255,255,255);
  rect(250,325,300,100);
  textSize(60);
  fill(33,73,205);
  text("Blue wins!",250,400);
  hasGameEnded = true;
}
