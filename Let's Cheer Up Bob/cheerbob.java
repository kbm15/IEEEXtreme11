// Don't place your source in a package
import java.util.*;
import java.lang.*;
import java.io.*;

// Please name your class Main
class Main {
	public static void main (String[] args) throws java.lang.Exception {
	    int a = 0;
	    int[][] preferencia = new int[3][3];;
	    Scanner in = new Scanner(System.in);
	    while(in.hasNextLine()){
		preferencia[a] = in.nextInt()*10;
		preferencia[a] = preferencia[a] + in.nextInt();
		in.nextLine();
		a++;
	    }
	    System.out.print(Arrays.toString(preferencia));
	}
	/*public static boolean alineados(int c, int d){
	    boolean resultado = false;
	    int resta = Math.abs(c-d);
	    if(resta<9){
	        resultado = true;
	    } 
	    if(resta)
	    return resultado;
	}*/
	public static int distancia(int[] datos){
	    
	    return resultado;
	}
}