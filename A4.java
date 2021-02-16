import java.io.*;
import java.util.*;
class A4 {
static Scanner _2;

	static PrintWriter _1;public static double f2(double x,double y) throws Exception{double z;
z=x*x-y*y;
return z;
}public static void main(String args[]) throws Exception{int x;
$_2 = new Scanner(new FileInputStream("A41.input"));
x=$_2.nextInt();
int y;
$_2 = new Scanner(new FileInputStream("A42.input"));
y=$_2.nextInt();
double z;
z=f2(x,y)+f2(y,x)*0.5;

_1 = new PrintWriter(new File("A4.output"));
$_1.print(z);$_1.close();
}}