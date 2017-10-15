iteracion = input("");


for i = 1:iteracion
    entrada = input("","s");
    celdas = strsplit (entrada);
    a=int64(str2num(char(celdas(1))));
    b=int64(str2num(char(celdas(2))));
    c=int64(str2num(char(celdas(3))));
    resultado=1;
    parcial=a;
    if(a==1)
            printf("%d\n", 1)
    else
        exponente= nchoosek(b,b-c);
        
        binario = dec2bin(exponente);
        for j = 1:length(binario)
            if(str2num(binario(length(binario)-j+1))==1)
                resultado=mod(resultado*parcial,10^9+7);
            endif
            parcial=mod(parcial*parcial,10^9+7);
        endfor
        printf("%d\n", resultado)
    endif
endfor