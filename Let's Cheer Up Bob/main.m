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

minimos = [dcol; ddia; drow];
[ix,iy]= find(minimos~=99);



a=0;

switch (ix(end))

    case 1
        for i = 1:3
            j=iy(end);    
                if(valor(i,j)~=1)
                    a=a+1;
                endif
        endfor
        
        for i = 1:3
            for j = 1:3
                if(valor(i,j)>1 && valor(i,j)<7 && j~=iy(end) && a>0)
                    printf("%d %d\n", i , j);
                    a=a-1;
                endif
            endfor
        endfor
        
    case 3
        for j = 1:3
            i=iy(end);    
                if(valor(i,j)~=1)
                    a=a+1;
                endif
        endfor
        
        for i = 1:3
            for j = 1:3
                if(valor(i,j)>1 && valor(i,j)<7 && i~=iy(end) && a>0)
                    printf("%d %d\n", i , j);
                    a=a-1;
                endif
            endfor
        endfor
        
    case 2
        if(iy(end)==1)
                for i = 1:3
                        if(valor(i,i)~=1)
                            a=a+1;
                        endif
                endfor
            for i = 1:3
                for j = 1:3
                    if(valor(i,j)>1 && valor(i,j)<7 && i~=j && a>0)
                        printf("%d %d\n", i , j);
                        a=a-1;
                    endif
                endfor
            endfor        
        else
            for i = 1:3
                for j = 1:3
                    if(valor(i,j)~=1 && i+j==4)
                     a=a+1;
                    endif
                endfor
            endfor
            for i = 1:3
                for j = 1:3
                    if(valor(i,j)>1 && valor(i,j)<=7 && i+j~=4  && a>0)
                        printf("%d %d\n", i , j);
                        a=a-1;
                    endif
                endfor
            endfor     
        endif
endswitch