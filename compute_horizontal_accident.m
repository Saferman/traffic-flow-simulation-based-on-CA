function cars=compute_horizontal_accident(plaza)
global shape_matrix;
global plazalength;
cars=0;
for i=1:length(shape_matrix)
    if plaza(plazalength-shape_matrix(i),i+1)>0
        if plaza(plazalength-shape_matrix(i),i+2)>0
            cars=cars+1;
            continue;
        end
        if plaza(plazalength-shape_matrix(i),i)>0
            cars=cars+1;
            continue;
        end
    end
end
end
