#include <iostream>
using namespace std;
#include <map>
#include <iostream>

typedef unsigned long long ull;

const ull M = 1000000007; // modulo
map<ull, ull> F;

ull f(ull n) {
	if (F.count(n)) return F[n];
	ull k=n/2;
	if (n%2==0) { // n=2*k
		return F[n] = (f(k)*f(k) + f(k-1)*f(k-1)) % M;
	} else { // n=2*k+1
		return F[n] = (f(k)*f(k+1) + f(k-1)*f(k)) % M;
	}
}


int main() {
    int t;
    ull n;
    ull paths;
    cin >> t;
	F[0]=F[1]=1;
    while(t > 0) {
        cin >> n;
        paths = f(n+2)-f(n+1);
        cout << paths << endl;
        t--;
    }
    return 0;
}