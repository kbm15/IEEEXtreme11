entrada = input("","s");

celdas = strsplit (entrada);
r=str2double(char(celdas(1)));
c=str2double(char(celdas(2)));



mapa = zeros(r,c);
for i = 1:r
    mapa(i,:) = scanf('%d', [1 c]);
endfor


salud = ones(20000,2);
contador = 0;


for i = 1:r
    contador = contador+1;
    if (i>2)
        for l = 2:i-1
            salud(contador, 2) = salud(contador, 2) +  mapa(l,1);
            if(salud(contador, 2)<salud(contador, 1))
                salud(contador, 1)=salud(contador, 2);
            endif
        endfor
    endif
    for j = 1:c
        salud(contador, 2) = salud(contador, 2) +  mapa(i,j);
        if(salud(contador, 2)<salud(contador, 1))
                salud(contador, 1)=salud(contador, 2);
            endif
    endfor
    
    for k = i+1:r
        salud(contador, 2) = salud(contador, 2) +  mapa(k,j);
        if(salud(contador, 2)<salud(contador, 1))
                salud(contador, 1)=salud(contador, 2);
            endif
    endfor   
endfor

mapat=transpose(mapa);


    
maximo=max(salud);
if (salud(maximo(2),2)<1)
    resultado=2-salud(maximo(2),2)+salud(maximo(2),1);
else
    resultado=1;
endif

disp(resultado)