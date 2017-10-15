valor = zeros (3, 3); 
for i = 1:3
    for j = 1:3
        entrada = input("","s");
        celdas = strsplit (entrada);
        uno=str2num(char(celdas(1)));
        dos=str2num(char(celdas(2)));
        valor(uno,dos)=(i-1)*3+j;
    endfor
endfor

a=0;

for i = 1:3
    for j = 1:3
        if(valor(i,j)>1 && valor(i,j)<7 && a<3)
            printf("%d %d\n", i , j);
            a=a+1;
        endif
    endfor
endfor


