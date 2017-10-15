data = str2num(input("","s"));

t = int64(data(1));
a = int64(data(2));
b = int64(data(3));
for i = 1:t 
    p = int64(input(""));
    res = 0;
    #factors = zeros(ceil(sqrt(b)),2);
    for n=b:-1:a
        n_res = 1;
        if ( mod(n,p) ~= 0 )
            n_res += 1;
        endif
        for div = ceil(sqrt(n)):-1:2
            #if (mod(n,div) == 0 && factors(div,1) == div) 
            #    n_res = n_res + factors(n,2);
            ##    break;
            #endif
            if ( mod(n,div) == 0 && mod(div,p) != 0 )
                n_res++;
            endif
        endfor
        
        #factors(n,:) = [n n_res];
        res += n_res;
    endfor
    printf("%d\n",res)
endfor