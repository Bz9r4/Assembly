//-------------------------
// C Code for Blinking LED
//-------------------------
extern "C"{
  void start();
  void led(byte);
}
void setup(){
  start();
}
void loop(){
  led(1); delay(200);
  led(0); delay(200);
}
