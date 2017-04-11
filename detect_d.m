function [d,v_forward,j_forward]=detect_d(plaza,one_path,j)
d=0;
v_forward=0;
j_forward=0;
for k=1:length(one_path)-j
    if plaza(one_path(k+j,1),one_path(k+j,2))==0
        d=d+1;
    else
        v_forward=plaza(one_path(k+j,1),one_path(k+j,2));
        j_forward=k+j;
        break;
    end
    if k==(length(one_path)-j)
        d=Inf;
    end
end
if (length(one_path)-j)==0
    d=Inf;
end
end