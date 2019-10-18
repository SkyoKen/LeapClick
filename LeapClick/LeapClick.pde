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
