//-------------------------
// C Code for Blinking LED
//-------------------------
extern "C"{
  void start();
  void ledvermelho();
  void ledamarelo();
  void ledverde();
}
void setup(){
  start();
}
void loop(){
  ledvermelho();  delay(2000);
  ledamarelo();   delay(1000);
  ledverde();     delay(2000);
}
