# LeapClick
Use leapmotion to control cursor.
## Table of Contents
* [About](#About)
* [Download](#Download)
* [Library](#Library)
* [Tested](#Tested)
* [Code](#Code)
## About

* right hand position -> cursorposition  
* left hand fist  -> left-click  
* right hand fist -> right-click  
## Download
* [Processing](https://processing.org/download/)
* [Leap Motion Orion 3.2.1](https://developer.leapmotion.com/releases)
## Library
* [Leap Motion for Processing](https://github.com/nok/leap-motion-processing)

## Tested
| Item  | Version |
|  ----  | ----  |
| OS  | Windows 10  |
| Processing  | processing-3.5.3 |
| Leap Motion Software  | 3.2.1+45911 |

## Code


```processing
import de.voidplus.leapmotion.*;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.*;

LeapMotion leap;
Robot robot;

boolean leftClick=false;
boolean rightClick=false;

void setup() {
  leap=new LeapMotion(this);
  try {
    robot=new Robot();
  }
  catch(AWTException e) {
    e.printStackTrace();
  }
}

void draw() {
  for (Hand hand : leap.getHands()) {
    if (hand.isRight()) {
      PVector pos=hand.getPosition();
      robot.mouseMove((int)pos.x*20, (int)pos.y*10+200);
      rightClick=(hand.getGrabStrength()==1)?true:rightClick;
    } else if (hand.isLeft()) {
      leftClick=(hand.getGrabStrength()==1)?true:leftClick;
    }
  }
  checkClick();
}

void checkClick() {
  if (leftClick) {
    leftClick();
    leftClick=false;
  }
  if (rightClick) {
    rightClick();
    rightClick=false;
  }
}

void leftClick() {
  robot.mousePress(InputEvent.BUTTON1_MASK);
  robot.delay(200);
  robot.mouseRelease(InputEvent.BUTTON1_MASK);
  robot.delay(200);
}

void rightClick() {
  robot.mousePress(InputEvent.BUTTON3_MASK);
  robot.delay(200);
  robot.mouseRelease(InputEvent.BUTTON3_MASK);
  robot.delay(200);
}
```
[TOP↑](#LeapCLick)
<p align="right">2019.10.18 23:59</p>  
