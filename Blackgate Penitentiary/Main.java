// Don't place your source in a package
import java.util.*;
import java.lang.*;
import java.io.*;

// Please name your class Main
class Main {
	public static void main (String[] args) throws java.lang.Exception {
	    Scanner in = new Scanner(System.in);
		int nLines = in.nextInt();
		String[] input;
		int height;
		String name;
		in.nextLine();
		SortedMap<Integer, TreeSet<String>> map = new TreeMap<Integer, TreeSet<String>>();
	    TreeSet<String> names;
		while (nLines>0) {
		    input = in.nextLine().split(" ");
		    name = input[0];
		    height = Integer.parseInt(input[1].trim());
		    names = map.get(height);
		    if (names == null) {
		        names = new TreeSet<String>();
		    }
		    names.add(name);
		    map.put(height, names);
		    nLines--;   
		}
		
		int start = 1, end = 1;
		String output;
		for (Map.Entry<Integer, TreeSet<String>> entry : map.entrySet()) {
		    output = "";
		    Iterator<String> it = entry.getValue().iterator();
		    while(it.hasNext()) {
		       name = it.next();
		       output += name + ' ';
		       end++;
		    } 
		    output += start + " " + (end-1);
		    System.out.println(output);
		    start=end;
		}
	}
}