// Don't place your source in a package
import java.util.*;
import java.lang.*;
import java.io.*;



// Please name your class Main
class Main {
	public static void main (String[] args) throws java.lang.Exception {
	    List<BigNode> bigNodes = new ArrayList<BigNode>();
	    final Scanner in = new Scanner(System.in);
		int t = in.nextInt();
		
		int nVertex, nEdges;
		int a, b;
		boolean foundLoop = false;
		BigNode[] aux;
		int auxIdx;
		List<Integer> listNodes;
		boolean ca, cb, matchedInBigNode, matchedCa, matchedCb;
		while(t>0) {
		    in.nextLine();
		    nVertex = in.nextInt();
		    nEdges = in.nextInt();
		    in.nextLine();
		    
		    // there will be a loop, no need to check it
		    if (nEdges >= nVertex) {
		        foundLoop = true;
		    } else {
		        while(nEdges>0) {
    		        a = in.nextInt();
    		        b = in.nextInt();
    		        
    		        if (a == b) {
    		            foundLoop = true;
    		            break;
    		        }
    		        
    		        auxIdx = 0;
    		        aux = new BigNode[2];
    		        if (bigNodes.isEmpty()) {
    		            bigNodes.add(new BigNode(a, b));
    		        } else {
    		            matchedInBigNode = false;
    		            matchedCa = false;
    		            matchedCb = false;
    		            for (final BigNode bigNode : bigNodes) {
        		            listNodes = bigNode.getNodes();
        		            ca = listNodes.contains(a);
        		            cb = listNodes.contains(b);
        		            if (ca && cb && !matchedCa && !matchedCb) {
        		                listNodes.add(a);
        		                listNodes.add(b);
        		                foundLoop = true;
        		                matchedInBigNode = true;
        		                matchedCa = true;
        		                matchedCb = true;
        		                break;
        		            } else if (ca && !matchedCa) {
        		                listNodes.add(a);
        		                listNodes.add(b);
        		                aux[auxIdx] = bigNode;
        		                auxIdx += 1;
        		                matchedCa = true;
        		            } else if (cb && !matchedCb) {
        		                listNodes.add(a);
        		                listNodes.add(b);
        		                aux[auxIdx] = bigNode;
        		                auxIdx += 1;
        		                matchedCb = true;
        		            }
        		        }
        		        
        		        if (foundLoop || matchedInBigNode) {
        		            break;
        		        } else if (!matchedCa && !matchedCb) {
        		            bigNodes.add(new BigNode(a,b));
        		        } else if (auxIdx == 2) {
        		            aux[0] = aux[0].merge(aux[1]);
        		            bigNodes.remove(aux[1]);
        		        }
        		    }
    		        nEdges--;
		        }
		    }
		    
		    if (foundLoop) {
		        System.out.println(1);
		    } else {
		        System.out.println(0);
		    }
		    
		    foundLoop = false;
		    bigNodes.clear();
		    t--;
		}
	}
}

class BigNode {
    private List<Integer> nodes;
    
    public BigNode(Integer a, Integer b) {
        this.nodes = new ArrayList<Integer>();
        this.nodes.add(a);
        this.nodes.add(b);
    }
    
    public List<Integer> getNodes() {
        return this.nodes;
    }
    
    public BigNode merge(BigNode bigNode) {
        this.nodes.addAll(bigNode.getNodes());
        return this;
    }
}