 player play;
platform [] platforms;
goal goal;
obstacle [] obstacle;
endDoor door;
endPlatform  ep;

int s = 6;                                        //speed of player
boolean up, down, left, right, operator, back;
boolean one, two, three, four, five = false;
boolean end = false;
boolean intro = true;
boolean instructions = false;
boolean gameplay = false;
boolean operatorS = false;
boolean endPlat = false;
boolean endD = false;
int deaths = 0;
PFont f1;

void setup() {
  size(1000, 650);  

  platforms = new platform[11];
  platforms[0] = new platform(85, 595);
  platforms[1] = new platform(465, 470);
  platforms[2] = new platform(730, 315);
  platforms[3] = new platform(355, 285);
  platforms[4] = new platform(235, 210);
  platforms[5] = new platform(510, 100);
  platforms[6] = new platform(793, 63);
  platforms[7] = new platform(105, 310);
  platforms[8] = new platform(5, 177);
  platforms[9] = new platform(53, 110);
  platforms[10] = new platform(240, 18);


  obstacle = new obstacle[50];
  obstacle[0] = new obstacle(490, 470, 506, 470, 498, 450);
  obstacle[1] = new obstacle(608, 470, 628, 470, 618, 444);
  obstacle[2] = new obstacle(641, 470, 654, 470, 647.5, 455);

  obstacle[3] = new obstacle(416, 290, 439, 290, 427.5, 325);
  obstacle[4] = new obstacle(479, 290, 496, 290, 487.5, 318);

  obstacle[5] = new obstacle(747, 315, 767, 315, 757, 285);
  obstacle[6] = new obstacle(768, 315, 790, 315, 779, 265);
  obstacle[7] = new obstacle(805, 315, 815, 315, 810, 295);
  obstacle[8] = new obstacle(830, 315, 845, 315, 837.5, 290);
  obstacle[9] = new obstacle(846, 315, 851, 315, 848.5, 300);
  obstacle[10] = new obstacle(876, 315, 910, 315, 893, 307);

  obstacle[11] = new obstacle(522, 285, 538, 285, 530, 265);
  obstacle[12] = new obstacle(490, 285, 507, 285, 498.5, 267);
  obstacle[13] = new obstacle(443, 285, 462, 285, 452.5, 250);
  obstacle[14] = new obstacle(508, 285, 521, 285, 514.5, 255);

  obstacle[15] = new obstacle(310, 210, 326, 210, 318, 190);
  obstacle[16] = new obstacle(327, 210, 343, 210, 335, 185);
  obstacle[17] = new obstacle(344, 210, 360, 210, 352, 193);
  obstacle[18] = new obstacle(361, 210, 377, 210, 369, 188);
  obstacle[19] = new obstacle(378, 210, 394, 210, 386, 180);
  obstacle[20] = new obstacle(395, 210, 411, 210, 403, 187);
  obstacle[21] = new obstacle(412, 210, 428, 210, 420, 195);
  obstacle[22] = new obstacle(238, 210, 253, 210, 245.5, 182);

  obstacle[23] = new obstacle(534, 100, 555, 100, 544.5, 73);
  obstacle[24] = new obstacle(578, 100, 598, 100, 588, 68);
  obstacle[25] = new obstacle(599, 100, 618, 100, 608.5, 80);
  obstacle[26] = new obstacle(619, 100, 640, 100, 629.5, 64);
  obstacle[27] = new obstacle(679, 100, 692, 100, 685.5, 85);
  obstacle[28] = new obstacle(516, 105, 539, 105, 527.5, 150);
  obstacle[29] = new obstacle(628, 105, 650, 105, 639, 138);

  obstacle[30] = new obstacle(805, 63, 825, 63, 815, 33);
  obstacle[31] = new obstacle(845, 63, 860, 63, 852.5, 40);

  obstacle[32] = new obstacle(260, 215, 278, 215, 269, 240);
  obstacle[33] = new obstacle(284, 215, 306, 215, 295, 258);

  obstacle[34] = new obstacle(357, 290, 377, 290, 367, 320);

  obstacle[35] = new obstacle(189, 178, 202, 178, 195.5, 167);

  obstacle[36] = new obstacle(227, 115, 244, 115, 235.5, 144);
  obstacle[37] = new obstacle(56, 115, 74, 115, 65, 135);
  obstacle[38] = new obstacle(76, 115, 94, 115, 85, 139);
  obstacle[39] = new obstacle(98, 115, 116, 115, 107, 145);
  obstacle[40] = new obstacle(117, 115, 135, 115, 126, 147);
  obstacle[41] = new obstacle(137, 115, 155, 115, 146, 142);
  obstacle[42] = new obstacle(162, 115, 176, 115, 169, 127);
  obstacle[43] = new obstacle(182, 115, 193, 115, 187.5, 124);

  obstacle[44] = new obstacle(135, 110, 157, 110, 146, 78);
  obstacle[45] = new obstacle(160, 110, 176, 110, 168, 90);
  obstacle[46] = new obstacle(61, 110, 78, 110, 69.5, 88);

  obstacle[47] = new obstacle(242, 23, 268, 23, 255, 68);
  obstacle[48] = new obstacle(325, 23, 350, 23, 337.5, 57);
  obstacle[49] = new obstacle(352, 23, 364, 23, 358, 44);

  play = new player();
  play.speedX = 0;
  play.speedY = 0;

  goal = new goal(940, 58);
  door = new endDoor(869, 550);

  ep = new endPlatform(717, 550);

  f1 = createFont("SansSerif.plain", 20);
}//setup
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void draw() {
  background(0);  
  noStroke();

  for (int i=0; i<platforms.length; i++) {
    if (touching(play, platforms[i])) {    //if they are touching then make the player land on the platform
      play.land(platforms[i].y);
      break;
    } else {
      play.touching = false;               //fall cuz player aint touching playform
    }
  }

  for (int i=0; i<obstacle.length; i++) {
    if (operator == false) {               //operator function
      if (play.x+play.w-2 >= obstacle[i].a && play.x+play.w-2 <= obstacle[i].c && play.y+play.h/2 <= obstacle[i].b && play.y+play.h/2 >= obstacle[i].f) {    //when right side of player touch spike facing up
        if (endPlat == false) {
          play.y = 485;
          play.x = 160;
          play.speedY = 0;
          deaths++;
        }
        if (endPlat == true) {
          play.x = 910;
          play.y = 18;
          play.speedY = 0;
          deaths++;
        }
      }
      if (play.x+play.w-2 >= obstacle[i].a && play.x+play.w-2 <= obstacle[i].c && play.y+play.h/2 >= obstacle[i].b && play.y+play.h/2 <= obstacle[i].f) {    //when right side of player touches spikes facing down
        if (endPlat == false) {
          play.y = 485;
          play.x = 160;
          play.speedY = 0;
          deaths++;
        }
        if (endPlat == true) {
          play.x = 910;
          play.y = 18;
          play.speedY = 0;
          deaths++;
        }
      }
      if (play.x+2 >= obstacle[i].a && play.x+2 <= obstacle[i].c && play.y+play.h/2 <= obstacle[i].b && play.y+play.h/2 >= obstacle[i].f) {    //when left side of player touch spike facing up
        if (endPlat == false) {
          play.y = 485;
          play.x = 160;
          play.speedY = 0;
          deaths++;
        }
        if (endPlat == true) {
          play.x = 910;
          play.y = 18;
          play.speedY = 0;
          deaths++;
        }
      }
      if (play.x+2 >= obstacle[i].a && play.x+2 <= obstacle[i].c && play.y+play.h/2 >= obstacle[i].b && play.y+play.h/2 <= obstacle[i].f) {    //when left side of player touches spikes facing down
        if (endPlat == false) {
          play.y = 485;
          play.x = 160;
          play.speedY = 0;
          deaths++;
        }
        if (endPlat == true) {
          play.x = 910;
          play.y = 18;
          play.speedY = 0;
          deaths++;
        }
      }
    }
  }

  if (end == true) {
    endScreen();
  }
  if (intro == true) {
    introScreen();
    back = false;
  }
  if (instructions == true) {
    instructionScreen();
  }
  if (gameplay == true) {
    game();
  }
  if (operatorS == true) {
    operatorScreen();
  }
  if (endPlat == true) {
    ep.display();
    if (touchingEndPlat(play, ep)) {
      play.land(ep.y);
    } else {
      play.touchingEndPlat = false;
    }
    if (play.y > height) { //after you reach the button set the respawn point there
      play.x = 910;
      play.y = 18;
      play.speedY = 0;
      deaths++;
    }
  }
  if (endD == true) {
    door.display();
    if ((play.x + play.w) >= door.x-23 && (play.x + play.w) <= door.x+23 && play.y+play.h-3 >= door.y-23 && play.y+play.h-3 <= door.y) { //if right side of player touches door
      end = true;
      gameplay = false;
      endPlat = false;
      endD = false;
    }
    if (play.x >= door.x-23 && play.x <= door.x+23 && play.y+play.h-3 >= door.y-23 && play.y+play.h-3 <= door.y) {  //if left side of player touches door
      end = true;
      gameplay = false;
      endPlat = false;
      endD = false;
    }
  }

  if (one == true) {
    play.y = 485;
    play.x = 160;
    deaths = 0;
    introScreen();
    intro = true;
    instructions = false;
    gameplay = false;
    end = false;
    operatorS = false;
    back = false;
    one = false;
    two = false;
    three = false;
    four = false;
    five = false;
    endPlat = false;
    endD = false;
  }
  if (two == true) {
    play.y = 485;
    play.x = 160;
    deaths = 0;
    intro = false;
    instructions = true;
    gameplay = false;
    end = false;
    operatorS = false;
    back = false;
    one = false;
    two = false;
    three = false;
    four = false;
    five = false;
    endPlat = false;
    endD = false;
  }
  if (three == true) {
    play.y = 485;
    play.x = 160;
    deaths = 0;
    intro = false;
    instructions = false;
    gameplay = true;
    end = false;
    operatorS = false;
    back = false;
    two = false;
    one = false;
    three = false;
    four = false;
    five = false;
    endPlat = false;
    endD = false;
  }
  if (four == true) {
    play.y = 485;
    play.x = 160;
    deaths = 0;
    intro = false;
    instructions = false;
    gameplay = false;
    end = true;
    operatorS = false;
    back = false;
    two = false;
    three = false;
    one = false;
    four = false;
    five = false;
    endPlat = false;
    endD = false;
  }
  if (five == true) {
    play.y = 485;
    play.x = 160;
    deaths = 0;
    intro = false;
    instructions = false;
    gameplay = false;
    end = false;
    operatorS = true;
    back = false;
    one = false;
    two = false;
    three = false;
    four = false;
    five = false;
    endPlat = false;
    endD = false;
  }
}//draw
/////////////////////////////////////////////////////////////////////////////////////////////////////////

boolean touching(player p, platform pp) {                                                             //got help from    https://www.youtube.com/watch?v=O8VyU4j6dT0&ab_channel=TheCodingTrain                                           
  float x = abs((p.x + p.w/2) - (pp.x + pp.w/2)); //distance between the center of the x values
  float distanceBetwCentX = p.w/2 + pp.w/2;  //total distance of half of their widths combined
  float y = abs((p.y + p.h/2) - (pp.y + pp.h/2)); //distance between the center of the y values
  float distanceBetwCentY = p.h/2 + pp.h/2;  //total distance of half of their heights combined

  if (x < distanceBetwCentX) {      //if distance between the center of the the x values is less than the total distance of half their widths
    if (y < distanceBetwCentY) {    // and if the distance between the center of the the y values is less than the total distance of half their heights
      return true;                  //then they are touching
    }
  }
  return false;
}//touching
/////////////////////////////////////////////////////////////////////////////////////////////////////////

boolean touchingEndPlat(player p, endPlatform pp) {
  float x = abs((p.x + p.w/2) - (pp.x + pp.w/2)); 
  float distanceBetwCentX = p.w/2 + pp.w/2; 
  float y = abs((p.y + p.h/2) - (pp.y + pp.h/2));  
  float distanceBetwCentY = p.h/2 + pp.h/2;  

  if (x < distanceBetwCentX) {    
    if (y < distanceBetwCentY) {    
      return true;
    }
  }
  return false;
}//touchingEndPlat
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void keyPressed() {
  switch (keyCode) {   //had friend explain to me that using cases for keyPressed is easier than using the if functions, cuz i dont have to put all the player movements in the keyPressed method
  case 37:  //left
    left = true;    //keep the left button pressed down
    break;
  case 39:  //right
    right = true;
    break;
  case 38:  //up
    up = true;
    break;
  case 40:  //down
    down = true;
    break;
  case 17:
    operator = true;
    break;
  case 8:
    back = true;
    break;
  case 49:
    one = true;
    break;
  case 50:
    two = true;
    break;
  case 51:
    three = true;
    break;
  case 52:
    four = true;
    break;
  case 53:
    five = true;
    break;
  }
}//keyPressed
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void keyReleased() {
  switch (keyCode) {
  case 37:  //left
    left = false;    //after keyreleased unpress the left button -> stop the left button
    break;
  case 39:  //right
    right = false;
    break;
  case 38:  //up
    up = false;
    break;
  case 40:  //down
    down = false;
    break;
  case 17:
    operator = false;
    break;
  }
}//keyReleased
/////////////////////////////////////////////////////////////////////////////////////////////////////////

class player {
  float x, y, w, h;
  float speedX, speedY;
  float gravity;
  boolean touching;
  boolean touchingEndPlat;

  player() {
    x = 160;
    y = 485;
    w = 15;
    h = 15;
    touching = false;
    gravity = 0.5;
  }
  //----------------------------------------------------------------------------------
  void moving() {
    x += speedX;  
    y += speedY;
    
    if (left == true) {
      speedX = -s;
    }
    if (right == true) {
      speedX = s;
    }
    if (left == false && right == false) {    //so that the player doesnt keep moving after the key is pressed     --> had friend also explain this part cuz i had trouble with the player keep moving in one direction after key is pressed
      speedX = 0;
    } else if (left == true && right == true) {
      speedX = 0;
    }
    if (up == true && touching == true || up == true && touchingEndPlat == true) {
      speedY = -13;
      touching = false;
      touchingEndPlat = false;
    }
    if (touching == false || touchingEndPlat == false) {
      speedY += gravity;
    }
    if (endPlat == false) {
      if (y > height) { //if fall off screen spawn at beginning
        y = 485;
        x = 160;
        speedY = 0;
        deaths++;
      }
    }
    if (y < 0) {
      y = 0; 
      speedY = 0;
    }
    if (x < 0) {
      x = 0;
      speedX = 0;
    }
    if (x+w > width) {
      x = width - w;
      speedX = 0;
    }
    if (operator == true) {
      gravity = 0;
      if (up) {
        speedY = -s;
      }
      if (down == true) {
        speedY = s;
      }
      if (up == false && down == false) {   
        speedY = 0;
      } else if (up == true && down == true) {
        speedY = 0;
      }
    } 
    if (operator == false) {
      gravity = 0.5;
    }
  }
  //----------------------------------------------------------------------------------
  void land(float yy) {
    speedY = 0;
    y = yy - h;                   //where the player is gonna be when its "landed"
    touching = true;
    touchingEndPlat = true;
  }
  //----------------------------------------------------------------------------------  
  void display() {
    strokeWeight(0);
    noStroke();
    fill(255, 255, 255);
    rect(x, y, w, h);
  }
}//player
/////////////////////////////////////////////////////////////////////////////////////////////////////////

class platform {
  float x, y, w, h;

  platform(float xx, float yy) {
    x = xx;
    y = yy;
    w = 203;
    h = 5;
  }
  //----------------------------------------------------------------------------------
  void display() {
    stroke(0);
    strokeWeight(1);
    fill(255, 255, 255);
    rect(x, y, w, h);
  }
}//platform
/////////////////////////////////////////////////////////////////////////////////////////////////////////

class endPlatform {
  float x, y, w, h;

  endPlatform(float xx, float yy) {
    x = xx;
    y = yy;
    w = 200;
    h = 5;
  }
  //----------------------------------------------------------------------------------
  void display() {
    stroke(0);
    strokeWeight(1);
    fill(255, 255, 255);
    rect(x, y, w, h);
  }
}

class goal {
  float x, y, w, h;

  goal(float xx, float yy) {
    x = xx; 
    y = yy;
    w = 15;
    h = 5;
  }
  //----------------------------------------------------------------------------------
  void display() {
    strokeWeight(0);
    fill(207, 39, 216);
    rect(x, y, w, h);
  }
}//goal
/////////////////////////////////////////////////////////////////////////////////////////////////////////

class endDoor {
  float x, y, w, h;

  endDoor(float xx, float yy) {
    x = xx;
    y = yy;
    w = 50;
    h = 50;
  }
  //----------------------------------------------------------------------------------
  void display() {
    stroke(0);
    fill(4, 78, 137);
    arc(x, y, w, h, PI, TWO_PI);
  }
}//endDoor
/////////////////////////////////////////////////////////////////////////////////////////////////////////

class obstacle {
  float a, b, c, d, e, f;

  obstacle(float x1, float y1, float x2, float y2, float x3, float y3) {
    a = x1;
    b = y1;
    c = x2;
    d = y2;
    e = x3;
    f = y3;
  }
  //----------------------------------------------------------------------------------  
  void display() {
    strokeWeight(0);
    noStroke();
    fill(247, 98, 92);
    triangle(a, b, c, d, e, f);
  }
}//obstacles
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void game() {
  background(0);

  for (int i=0; i<platforms.length; i++) {
    platforms[i].display();
  }
  for (int i=0; i<obstacle.length; i++) {
    obstacle[i].display();
  }

  textSize(13);
  fill(255);
  textAlign(LEFT);
  text("Deaths: " + deaths, 10, 20);

  if (goal.x <= (play.x + play.w) && (play.x + play.w) <= (goal.x + goal.w) && play.y+play.h-3 >= goal.y && play.y+play.h-3 <= goal.y+goal.h) {
    endPlat = true;
    endD = true;                                                            //touching goal or not and if touching goal then open the door
  }
  if (goal.x <= play.x && play.x <= (goal.x + goal.w) && play.y+play.h-3 >= goal.y && play.y+play.h-3 <= goal.y+goal.h) {
    endPlat = true; 
    endD = true;
  }

  goal.display();
  play.display();
  play.moving();
}//game
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void endScreen() {
  background(0);
  textSize(32);
  textAlign(CENTER);
  background(0);
  text("Congratulations You Passed!", width/2, height/2-100);
  textSize(20);
  text("Number of deaths: " + deaths, width/2, height/2 - 50);
  textSize(30);
  text("More levels to be released", width/2, height/2);
  textSize(20);
  fill(242, 59, 129);
  rect(width/2-71.5, height/2+48, 143, 42, 10);
  fill(255);
  text("Play Again", width/2, height/2+75);
  fill(115, 203, 198);
  rect(width/2-125, height/2+108, 250, 42, 10);
  fill(255);
  text("Return to Main Menu", width/2, height/2+135);
}//endScreen
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void introScreen() {
  background(0);
  textSize(45);
  textAlign(CENTER);
  text("The Platform Game", width/2, height/2-150);

  stroke(0);
  fill(255, 255, 255);
  rect(47, 579, 200, 5);
  noStroke();
  rect(71, 564, 15, 15);
  stroke(0);
  rect(760, 548, 200, 5);
  fill(4, 78, 137);
  noStroke();
  arc(878, 548, 50, 50, PI, TWO_PI);

  fill(115, 203, 198);
  rect(452.5, 295, 95, 47, 10);
  fill(255, 255, 255);
  textSize(20);
  text("START", width/2, height/2);

  fill(115, 203, 198);
  rect(429, 379, 140, 43, 10);
  fill(255);
  text("How to Play", width/2, height/2+80);
  
  textSize(11);
  text("By: Frank Yu", 955, 640);
}//introScreen
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void instructionScreen() {
  background(0);
  textAlign(CENTER);
  textSize(20);
  fill(255);
  text("The objective of the game is to use the arrow keys to jump from platform to platform to try and reach the purple button", width/2-262.5, height/2-250, 525, 200);
  stroke(0);
  rect(width/2-75, 184, 150, 5);
  fill(207, 39, 216);
  noStroke();
  rect(width/2-7.5, 179, 15, 5);
  fill(255);
  text("After you reach the purple button, it will then open a door that you will have to reach to finish the game", width/2-262.5, height/2-110, 525, 200);
  stroke(0);
  rect(width/2-75, 310, 150, 5);
  fill(4, 78, 137);
  noStroke();
  arc(width/2, 310, 50, 50, PI, TWO_PI);

  fill(255);
  text("Red spikes are your enemy, avoid them", width/2, height/2+25);
  stroke(0);
  rect(width/2-75, 423, 150, 5);
  fill(247, 98, 92);
  noStroke();
  triangle(460, 423, 487, 423, 473.5, 389);
  triangle(525, 423, 545, 423, 535, 400);
  stroke(255, 0, 0);
  strokeWeight(2);
  line(412, 372, 596, 443);
  line(596, 372, 412, 443);
  fill(255);
  text("If you touch the spikes or fall off the map you will be set back to the beginning, but after you reach the purple button that will be your new respawn point", width/2-262.5, height/2+125, 525, 200);
  textSize(13);
  text("Press the backspace to return to homescreen", 148, 637);
  noStroke();
  fill(76, 229, 74);
  rect(902, 597, 80, 37, 10);
  fill(255);
  text("Operator", 942, 620);

  if (back == true) {
    intro = true;
    instructions = false;
    operatorS = false;
  }
}//intructionScreen
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void operatorScreen() {
  background(0);
  textAlign(CENTER);
  textFont(f1, 45);
  fill(76, 229, 74);
  text("Operator Instructions", width/2, height/2-200);
  stroke(76, 229, 74);
  strokeWeight(2);
  line(281, 128, 718, 128);
  textSize(30);
  text("Use the number keys to directly switch", width/2, height/2-150);
  text("to each corresponding scene", width/2, height/2-115);
  textSize(20);
  text("1 - Main Menu Screen", width/2, height/2-85);
  text("2 - Instructions Screen", width/2, height/2-60);
  text("3 - Gameplay Screen", width/2, height/2-35);
  text("4 - Ending Screen", width/2, height/2-10);
  text("5 - Operator Screen", width/2, height/2+15);
  textSize(30);
  text("When on the gameplay screen, hold", width/2, height/2+50);
  text("down the ctrl key while using the arrow", width/2, height/2+85);
  text("keys to remove gravity and control the", width/2, height/2+120);
  text("player however you like", width/2, height/2+155);
  textSize(13);
  fill(255);
  text("Press the backspace to return to homescreen", 148, 637);

  if (back == true) {
    intro = true;
    instructions = false;
    operatorS = false;
  }
}//operatorScreen
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void mousePressed() {
  println("Mouse is at x: " + mouseX);
  println("Mouse is at y: " + mouseY);

  if (intro == true) {
    if (mouseX >= 452.5 && mouseX <= 547.5 && mouseY >= 295 && mouseY <= 342) {      //play button
      intro = false; 
      instructions = false;
      gameplay = true;
      end = false;
      operatorS = false;
    }
    if (mouseX >= 429 && mouseX <= 569 && mouseY >= 379 && mouseY <= 422) {          //instructions button
      intro = false;                                                          
      instructions = true;      
      end = false;
      gameplay = false;
      operatorS = false;
    }
  }
  if (instructions == true) {
    if (mouseX >= 902 && mouseX <= 982 && mouseY >= 597 && mouseY <= 634) {          //operator instructions button
      intro = false;                                                          
      instructions = false;      
      end = false;
      gameplay = false;
      operatorS = true;
    }
  }
  if (end == true) {
    if (mouseX >= 428.5 && mouseX <= 571.5 && mouseY >= 373 && mouseY <= 415) {     //play again button
      play.y = 485;
      play.x = 160;
      deaths = 0;
      end = false;                                                           
      intro = false;                                                             
      instructions = false;
      gameplay = true;
      operatorS = false;
    }
    if (mouseX >= 375 && mouseX <= 625 && mouseY >= 433 && mouseY <= 475) {          //back to main menu button
      play.y = 485;
      play.x = 160;
      deaths = 0;
      end = false;
      intro = true;
      instructions = false;
      gameplay = false;
      operatorS = false;
    }
  }
}//end mousePressed
