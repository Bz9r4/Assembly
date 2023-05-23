//------------------------------------------------
// Programming Serial Port - Printing Text Message
//------------------------------------------------
extern "C"
{
  void init_serial();
  void print_msg();
}
//----------------------------------------------------
void setup()
{
  init_serial();
}
//----------------------------------------------------
void loop()
{
  print_msg();
}
