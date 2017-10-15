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
    contador++;
    if (i>1)
        for l = 1:i
            posicion = posicion + [0 1];
            salud(contador, 2) = salud(contador, 2) +  mapa(k,j);
        endfork
    endif
    for j = 1:c
        posicion = posicion + [1 0];
        salud(contador, 2) = salud(contador, 2) +  mapa(i,j);
    endfor
    for k = i:r
        posicion = posicion + [0 1];
        salud(contador, 2) = salud(contador, 2) +  mapa(k,j);
    endfor
    posicion = [1 1]
endfor
    
    disp(salud);
    
