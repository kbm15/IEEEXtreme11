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

drow = zeros(1,3);
for i = 1:3
    if (max(valor(i, :))>7)
      drow(i) = 99;
    else
      drow(i) = abs(valor(i,1)-valor(i,2))+abs(valor(i,3)-valor(i,2));
    endif
endfor

dcol = zeros(1,3);
for i = 1:3
    if (max(valor(:, i))>7)
        dcol(i) = 99;
    else
        dcol(i) = abs(valor(1,i)-valor(2,i))+abs(valor(3,i)-valor(2,i));
    endif
endfor

ddia = zeros(1,3);
if (max(valor(1,1), valor(2,2), valor(3,3))>7)
    ddia(1) = 99;
else
    ddia(1) = abs(valor(1,1)-valor(2,2))+abs(valor(3,3)-valor(2,2));
endif
if (max(valor(1,3), valor(2,2), valor(3,1))>7)
    ddia(2) = 99;
else
    ddia(2) = abs(valor(1,3)-valor(2,2))+abs(valor(3,1)-valor(2,2));
endif
ddia(3) = 99;

minimos = [dcol; drow; ddia];
[ix,iy]= find(minimos~=99);


disp([ix(end),iy(end)]);