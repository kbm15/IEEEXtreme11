
entrada = input("","s");

celdas = strsplit (entrada);
r=str2num(char(celdas(1)));
c=str2num(char(celdas(2)));

mapa = zeros(r,c);
for i = 1:r
    entrada = input("","s");
    fila = strsplit (entrada);
    for j = 1:c
        mapa(i,j) = str2num(char(fila(j)));
    endfor
endfor

posicion = ones(1,2);
salud = ones(10,2);
contador = 0;


for i = 1:r
    contador = contador+1;
    
    if (i>2)
        for l = 2:i-1
            posicion = posicion + [1 0];
            salud(contador, 2) = salud(contador, 2) +  mapa(2,1);
        endfor
    endif
    for j = 1:c
        posicion = posicion + [0 1];
        salud(contador, 2) = salud(contador, 2) +  mapa(i,j);
    endfor
    
    for k = i+1:r
        posicion = posicion + [1 0];
        salud(contador, 2) = salud(contador, 2) +  mapa(k,j);
    endfor   
    posicion = [1 1];
endfor

mapat=transpose(mapa);

for i = 1:r
    contador = contador+1;
    
    if (i>2)
        for l = 2:i-1
            posicion = posicion + [1 0];
            salud(contador, 2) = salud(contador, 2) +  mapat(2,1);
        endfor
    endif
    for j = 1:c
        posicion = posicion + [0 1];
        salud(contador, 2) = salud(contador, 2) +  mapat(i,j);
    endfor
    
    for k = i+1:r
        posicion = posicion + [1 0];
        salud(contador, 2) = salud(contador, 2) +  mapat(k,j);
    endfor   
   
    posicion = [1 1];
endfor
    
maximo=max(salud);
if (salud(maximo(2),2)<1)
    resultado=2-salud(maximo(2),2);
else
    resultado=1;
endif

disp(resultado)