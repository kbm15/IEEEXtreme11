#include <stdio.h>
#include <math.h>

unsigned int d, res, t, i, j, a, b, sq;

int main() {
    scanf("%d %d %d\n", &t, &a, &b);
    while(t) {
        scanf("%d\n", &d);
        res = b - a + 1;
        
        for(i=a; i<=b; i++) {
            sq = (unsigned int) sqrt(i);
            for (j=2; j<=sq+1; j++) {
                if (i % j == 0 && j % d != 0) {
                    res += 1;
                }
            }
            if ( i % d != 0) {
                res += 1;
            }
        }
        
        printf("%d\n", res);
        t--;
    }
    return 0;
}