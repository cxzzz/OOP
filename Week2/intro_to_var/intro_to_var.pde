void setup() {
  println(i); // global var somehow doesn't gives error without init.
  
  //int ii = 0; // local var must be init.
  
  
  //println(ii);
}

void draw() {
 i = 100;
 f = 100.0f; // float constant
 f = 100.0; // double constant
 f = i; // convert int to float
 //i = f; // float to int. compiler error, since flaot to int
 i = (int)f; // convert float to int. casting
 
 b = true;
 
 if (b) {
  println("true");
 }
 
 b = (f == 100); // boolean comparasion
 int j;
 j = i++;
 i = 10;
 i++;
 println(j);
 i += 1;
 i = i + 1;
 i = 10;
 j = ++ i;
 println(j);
 
}

int i;
float f;
char c;
String s;
double d;
boolean b;