/**   
/*    Original starter code by: Bradley Beth
/*    Starter code updated by: Erik Dillaman, January 2016
/*    Filters/main functionality added by: Ian Fernandes
 **/

// changelog:
// 3.1  added e*Pressed switches and noLoop(); 
// 3.2  added img.resize() to line 132, for students with more advanced filters
// 3.25 possible fix for the double-click bug
// 9000 four filters added, aesthetics updated (major functionality update)

boolean PicLoaded = false;
boolean Grayscale = false;
boolean Effect1 = false;
boolean Effect2 = false;
boolean Effect3 = false;
boolean Effect4 = false;
boolean gPressed = false;
boolean e1Pressed = false;
boolean e2Pressed = false;
boolean e3Pressed = false;
boolean e4Pressed = false;
int picWidth = 0;
int picHeight = 0;
PImage img, resetImg;
PFont rockwell;
PFont rockwellBold;

/***********************************/

/**
*  Set up the basic screen and other relevant options
*/
void setup() 
{
  noLoop();
  size(800, 480);
  background(185);
  textAlign(LEFT);
  textSize(16);
  
  //Initialize text fonts
  rockwellBold = createFont("Rockwell Bold", 18);
  rockwell = createFont("Rockwell", 16);
}

/**
*  Draw the updated screen.
*/
void draw()
{

  background(170);
  fill(0);
  rect(0, 0, 649, 480);
  noStroke();
  int picStart = 0;
  int picEnd = 0;


  /* draw labels and buttons */

  //File Label
  stroke(0);
  fill(0);
  textSize(16);
  textFont(rockwellBold);
  text("File Operations", 658, 25);
  line(650, 0, 650, 480);
  noStroke();

  //Load Picture
  fill(255);
  rect(660, 40, 130, 40, 10);
  fill(55);
  textFont(rockwell);
  text("Load Picture", 680, 65);

  //Save Picture
  fill(255);
  rect(660, 90, 130, 40, 10);
  fill(55);
  text("Save Picture", 680, 115);

  //Line Separation
  stroke(0);
  line(650, 140, 800, 140);
  noStroke();

  //Filter Effects Label
  stroke(0);
  fill(0);
  textSize(16);
  textFont(rockwellBold);
  text("Filter Effects", 668, 168);
  line(650, 0, 650, 480);
  noStroke();

  //Grayscale Filter
  if (Grayscale)
    fill(#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);
  rect(660, 185, 130, 40, 10);
  fill(55);
  textFont(rockwell);
  text("Grayscale", 685, 210);

  //Effect 1: RGB "Static" Saturation Filter
  if (Effect1)
    fill(#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);
  rect(660, 235, 130, 40, 10);
  fill(55);
  text("R/G/B Static", 680, 250);
  text("Saturation", 688, 270);

  //Effect 2: Invert 2.0 Filter
  if (Effect2)
    fill (#FFFF7D);     //Effect on means a yellow lighted button 
  else
    fill(255); 
  rect(660, 285, 130, 40, 10);
  fill(55);
  text("Invert 2.0", 690, 310);

  //Effect 3: Flip and Whiten or Darken Filter
  if (Effect3)
    fill (#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);   
  rect(660, 335, 130, 40, 10);
  fill(55);
  text("Flip and", 690, 350);
  text("Whiten or Darken", 660, 370);

  //Effect 4: Blurry Effect Filter
  if (Effect4)
    fill (#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);   
  rect(660, 385, 130, 40, 10);
  fill(55);
  text("Blurry Effect", 680, 410);

  //Reset Button
  fill(255, 0, 0);
  rect(693, 435, 65, 40, 10);
  fill(255);
  text("Reset", 706, 460);

  noStroke();
  textSize(16);

  //The following loads and displays an image file.
  //The image is resized to best fit in a 640x480 frame.
  if (PicLoaded)
  {     
    picWidth = img.width;
    picHeight = img.height;

    if (picWidth > 640)
    {
      picHeight = (int)(picHeight*(640.0/picWidth));
      picWidth = 640;
    }
    if (picHeight > 480)
    {
      picWidth = (int)(picWidth*(480.0/picHeight));
      picHeight = 480;
    }
    img.resize(picWidth, picHeight);
    image(img, (640-picWidth)/2, (480-picHeight)/2, picWidth, picHeight);
    //  (640-picWidth)/2, (480-picHeight)/2    to CENTER
    picStart = 0;
    picEnd = picStart+img.width*img.height;


    /***** Effects Code *****/
    
    /*
      This effect turns the image grayscale (various shades of black)
    */
    if (Grayscale && !gPressed)
    {
      img.loadPixels();
      int i = picStart;
      while (i < picEnd) 
      {
        color c = img.pixels[i];
        float gray = (red(c)+green(c)+blue(c))/3.0;  //average the RGB colors
        img.pixels[i] = color(gray, gray, gray);
        i = i + 1;
      }
      gPressed = true;
    }

    /*
      This effect makes the image appear to have a red, green, or blue "static" saturation based on what key is pressed before.
    */
    if (Effect1 && !e1Pressed)
    {
      img.loadPixels();
      int j = picStart;
      if (key=='r') {
        while (j<picEnd) {
          color thisPixel = img.pixels[j];
          img.pixels[j] = color(red(thisPixel)+50, green(thisPixel), blue(thisPixel));
          if (random(1)>.5) {
            j++;
          }
          j++;
        }
      } else if (key=='g') {
        while (j<picEnd) {
          color thisPixel = img.pixels[j];
          img.pixels[j] = color(red(thisPixel), green(thisPixel)+50, blue(thisPixel));
          if (random(1)>.5) {
            j++;
          }
          j++;
        }
      } else if(key=='b') {
        while(j<picEnd) {
          color thisPixel = img.pixels[j];
          img.pixels[j] = color(red(thisPixel), green(thisPixel), blue(thisPixel)+50);
          if(random(1)>.5) {
              j++;
          }
          j++;
        }
      } else {
        println("Press the r, g, or b key before pressing the button to get their respective effects.");
      }
      e1Pressed = true;
    }

    /*
      This effect inverts the colors of the image. Each variation depends on a 1/2 probability.
    */
    if (Effect2)
    {
      img.loadPixels();
      int k = picStart;
      
      if(random(1)>0.5) {
        while(k<picEnd) {
          color thisPixel = img.pixels[k];
          img.pixels[k] = color(green(thisPixel), blue(thisPixel), red(thisPixel));
          k++;
        }
      } else {
        while(k<picEnd) {
          color thisPixel = img.pixels[k];
          img.pixels[k] = color(green(thisPixel), red(thisPixel), blue(thisPixel));
          k++;
        }
      }
      e2Pressed = true;
      Effect2 = false;
    }

    /*
      This effect flips the image. Additionally, the image is darkened or lightened based on a 1/2 probability.
    */
    if (Effect3 &&!e3Pressed)
    {
      color[] d = new color[img.pixels.length];
      img.loadPixels();
      int l = picStart;
      while(l<img.pixels.length) {
       d[l] = img.pixels[l];
       l++;
      }
      
      int y = picStart;
      if(random(1)>0.5) {
        while(y<img.pixels.length) {
         img.pixels[y] = color(red(d[img.pixels.length-1-y])+70, green(d[img.pixels.length-1-y])+70, blue(d[img.pixels.length-1-y])+70);
         y++;
        }
      } else {
        while(y<img.pixels.length) {
          img.pixels[y] = color(red(d[img.pixels.length-1-y])-70, green(d[img.pixels.length-1-y])-70, blue(d[img.pixels.length-1-y])-70);
          y++;
        }
      }
      
      e3Pressed = true;
    }

    /*
      This effect shifts every other pixel over in order to create a blurry effect. It can be applied multiple times in order to shift a mirror image of the original.
    */
    if (Effect4)
    {
      color tempPixel1 = color(0,0,0);
      color tempPixel2= color(0,0,0);
      
      int n = 0;
      while(n<5) {
       img.loadPixels();
       int counter = 0;
       while(counter<img.pixels.length) {
        if(counter%2==0) {
          tempPixel2 = color(red(img.pixels[counter]), green(img.pixels[counter]), blue(img.pixels[counter]));
          img.pixels[counter] = color(red(tempPixel1), green(tempPixel1), blue(tempPixel1));
          tempPixel1 = tempPixel2;
          img.updatePixels();
        }
        counter++;
       }
       n++;
      }
      
      e4Pressed = true;
    }

    //Update the screen
    img.updatePixels(); 
    redraw();
  }

  fill(255);
  noStroke();
  redraw();
}

void mouseClicked() {
  redraw();
}

/**
* Selects the correct filter/option based on where the mouse clicked.
*/
void mousePressed()
{
  //The following define the clickable bounding boxes for any buttons used.
  //Note that these boundaries should match those drawn in the draw() function.

  if (mouseX>660 && mouseX<790 && mouseY>40 && mouseY<80)
  {
    selectInput("Select a file to process:", "infileSelected");
  }

  if (mouseX>660 && mouseX<790 && mouseY>90 && mouseY<130)
  {
    selectOutput("Select a file to write to:", "outfileSelected");
  }

  if (mouseX>660 && mouseX<790 && mouseY>185 && mouseY<225 && PicLoaded)
  {
    Grayscale = true;
    
    Effect1 = false;
    Effect2 = false;
    Effect3 = false;
    Effect4 = false;
    
    redraw();
  }   

  if (mouseX>660 && mouseX<790 && mouseY>235 && mouseY<275 && PicLoaded)
  {
    Effect1 = true;
    
    Grayscale = false;
    Effect2 = false;
    Effect3 = false;
    Effect4 = false;
    
    redraw();
  } 

  if (mouseX>660 && mouseX<790 && mouseY>285 && mouseY<325 && PicLoaded)
  {
    Effect2 = true;
    
    Effect1 = false;
    Grayscale = false;
    Effect3 = false;
    Effect4 = false;
    
    redraw();
  }  

  if (mouseX>660 && mouseX<790 && mouseY>335 && mouseY<375 && PicLoaded)
  {
    Effect3 = true;
    
    Effect1 = false;
    Effect2 = false;
    Grayscale = false;
    Effect4 = false;
    
    redraw();
  }
  
  if (mouseX>660 && mouseX<790 && mouseY>385 && mouseY<425 && PicLoaded)
  {
    Effect4 = true;
    
    Effect1 = false;
    Effect2 = false;
    Effect3 = false;
    Grayscale = false;
    
    redraw();
  }

  if (mouseX>693 && mouseX<758 && mouseY>435 && mouseY<475 && PicLoaded)
  {
    resetTheImage();
    redraw();
  }
}

/**
*  Reset all filter booleans
*/
void resetTheImage()
{
  Grayscale = false;
  Effect1 = false;
  Effect2 = false;
  Effect3 = false;
  Effect4 = false;
  gPressed = false;
  e1Pressed = false;
  e2Pressed = false;
  e3Pressed = false;
  e4Pressed = false;
  if (PicLoaded)
    img = resetImg.get();
}

/**
*  Handle input file
*/
void infileSelected(File selection) 
{
  if (selection == null) 
  {
    println("IMAGE NOT LOADED: Window was closed or the user hit cancel.");
  } else 
  {
    resetTheImage();    
    println("IMAGE LOADED: User selected " + selection.getAbsolutePath());

    img = loadImage(selection.getAbsolutePath());
    resetImg = loadImage(selection.getAbsolutePath());
    if(img!=null)
      PicLoaded = true;
    else
      println("Could not load picture. Try a different file format.");
    redraw();
  }
}

/**
*  Handle output file
*/
void outfileSelected(File selection) 
{
  if (selection == null) 
  {
    println("IMAGE NOT SAVED: Window was closed or the user hit cancel.");
  } else 
  {
    println("IMAGE SAVED: User selected " + selection.getAbsolutePath());
    img.save(selection.getAbsolutePath());
    redraw();
  }
}