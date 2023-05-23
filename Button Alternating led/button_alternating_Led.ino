//------------------------------------
// C Code to control led using button
//------------------------------------
extern "C"{
  void start();
  void btnLED(byte);
}
void setup(){
  start();
}
void loop(){
  btnLED(2); delay(200);
}
