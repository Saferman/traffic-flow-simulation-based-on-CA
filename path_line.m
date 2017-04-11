function paths=path_line(B,m,L)
global plazalength;   
global shape_matrix; 
%现在先进行m1=m2=m3=3合并的情况
%Paths is a 1xB-dimensional cell, each element is an Nx2-dimensional matrix
%. The coordinates in plaza each line is a point in the row and column coordinates
%B
%L
%m
%plazalength
%shape_matrix
goal=[];
L_pos=find(shape_matrix==0);
for i=1:B
    tem=i;
    for j=1:L
        if tem<=m(j)
            goal(i)=L_pos(j)+1;
            break;
        else
            tem=tem-m(j);
        end
    end
end

for i=1:B   
    a=i+1;  
    b=1;    
    j=1;
    flag=1;
    while(1)
        paths{i}(j,:)=[b a];
        if flag==0
            break;
        end
        if (plazalength-b)<=shape_matrix(a-1)
            if i>L_pos(ceil(length(L_pos)/2))
                a=a-1;
            else
                a=a+1;
            end
        else if b==plazalength-1
                if a<goal(i)
                    a=a+1;
                end
                if a>goal(i)
                    a=a-1;
                end
                if a==goal(i)
                    b=b+1;
                    flag=0;
                end
            else
                b=b+1;
            end
        end
        j=j+1;
    end
end
end

