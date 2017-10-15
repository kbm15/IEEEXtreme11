// Don't place your source in a package
import java.util.*;
import java.lang.*;
import java.io.*;

// Please name your class Main
class Main {
	public static void main (String[] args) throws java.lang.Exception {
	    int result = 0;
	    Scanner in = new Scanner(System.in);
		int n = in.nextInt();
		in.nextLine();
		
	    boolean[][] familyMatrix = new boolean[n][n];
	    
	    TreeMap<Integer, List<Integer>> familyPriority = new TreeMap<Integer, List<Integer>>();
		
		boolean[] familyLocated = new boolean[n];
		for (int idx=0; idx<n; idx++) {
		    familyLocated[idx] = false;
		}
	    
		int priority;
		List<Integer> priorityList;
		for(int familyIdx=0; familyIdx<n; familyIdx++) {
		    priority = 1;
		    for(int familyIdxAux=0; familyIdxAux<n; familyIdxAux++){
		        familyMatrix[familyIdx][familyIdxAux] = true;
		    }
		    
		    familyMatrix[familyIdx][familyIdx] = false;
		    
		    String[] blocked = in.nextLine().split(" ");
		    for (int idx=0; idx<blocked.length; idx++) {
		        priority += 1;
		        familyMatrix[familyIdx][Integer.parseInt(blocked[idx].trim())] = false;
		    }
		    
		    priorityList = familyPriority.get(-priority);
		    if (priorityList == null) {
		        priorityList = new ArrayList<Integer>();
		    }
		    priorityList.add(familyIdx);
		    familyPriority.put(-priority, priorityList);
	    }
	    
	    for (Map.Entry<Integer, List<Integer>> entry : familyPriority.entrySet()) {
	        for(Integer familyId : entry.getValue()){
	            if (Math.ceil((double) n/2) > familyId) {
        	        for (int j=0; j<n; j++) {
        	            if (familyMatrix[familyId][j]) {
        	                for (int i=0; i<n; i++) {
        	                    familyMatrix[i][j] = false;
        	                }
        	                familyLocated[j] = true;
        	                break;
        	            }
        	        }
	            } else {
	                for (int j=n-1; j>=0; j--) {
        	            if (familyMatrix[familyId][j]) {
        	                for (int i=0; i<n; i++) {
        	                    familyMatrix[i][j] = false;
        	                }
        	                familyLocated[j] = true;
        	                break;
        	            }
        	        }
	            }
	        }
	    }
	    
	    for (int i=0; i<n; i++) {
	        if (!familyLocated[i]) {
	            result += 1;
	        }
	    }
		
		System.out.println(result);
	}
}