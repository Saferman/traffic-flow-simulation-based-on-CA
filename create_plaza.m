function plaza = create_plaza(B, L)
global plazalength
global shape_matrix;
plaza = zeros(plazalength,B+2);
plaza(1:plazalength,[1,2+B]) = -888;
if mod(B-L,2)==0 
    for col=1:B
        plaza((plazalength-shape_matrix(col)+1):plazalength,col+1)=-888;        
    end
else
    plaza(1:plazalength, B+3) = -888;  
    for col=1:B
        plaza((plazalength-shape_matrix(col)+1):plazalength,col+1)=-888;        
    end
end