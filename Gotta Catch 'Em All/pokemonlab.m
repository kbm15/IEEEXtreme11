entrada = input('');

celdas = strsplit (entrada);
r=str2double(char(celdas(1)));
c=str2double(char(celdas(2)));

mapa = zeros(r,c);
for i = 1:r
    entrada = input('');
    fila = strsplit (entrada);
    for j = 1:c
        mapa(i,j) = str2double(char(fila(j)));
    end
end

posicion = ones(1,2);
salud = ones(10,2);
contador = 0;


for i = 1:r
    contador = contador+1;
    
    if (i>2)
        for l = 2:i-1
            posicion = posicion + [1 0];
            salud(contador, 2) = salud(contador, 2) +  mapa(2,1);
        end
    end
    for j = 1:c
        posicion = posicion + [0 1];
        salud(contador, 2) = salud(contador, 2) +  mapa(i,j);
    end
    
    for k = i+1:r
        posicion = posicion + [1 0];
        salud(contador, 2) = salud(contador, 2) +  mapa(k,j);
    end   
    posicion = [1 1];
end

mapat=transpose(mapa);

for i = 1:r
    contador = contador+1;
    
    if (i>2)
        for l = 2:i-1
            posicion = posicion + [1 0];
            salud(contador, 2) = salud(contador, 2) +  mapat(2,1);
        end
    end
    for j = 1:c
        posicion = posicion + [0 1];
        salud(contador, 2) = salud(contador, 2) +  mapat(i,j);
    end
    
    for k = i+1:r
        posicion = posicion + [1 0];
        salud(contador, 2) = salud(contador, 2) +  mapat(k,j);
    end   
   
    posicion = [1 1];
end
    
maximo=max(salud);
if (salud(maximo(2),2)<1)
    resultado=2-salud(maximo(2),2);
else
    resultado=1;
end
