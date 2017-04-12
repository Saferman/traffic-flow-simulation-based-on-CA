function [average_P,cost,W]=cellularF(Y,m,number_T,L,B,shape_matrix_value,Vmax,autoVmax,ak,a,bm,bMAT,bEAT,bECT,lamda, draw)
%[average_P,cost,W]=cellularF(21,[1 6 2],24,3,9,[5 2 1 0 0 0 1 2 5],8.1,10.2,0,4,[0 4 5],8,5,5,10000,1)
%[average_P,cost,W]=cellularF(21,[1 6 2],24*3600,3,9,[5 2 1 0 0 0 1 2 5],8.1,10.2,0,4,[0 4 5],8,5,5,400000,1)
%%
W = 0;
%Different_P=zeros(1,7);
cost = ((Y-1)*B-sum(shape_matrix_value))*a+bMAT*B*bm(1)/sum(bm)+bEAT*B*bm(2)/sum(bm)+bECT*B*bm(3)/sum(bm);
for j = 0
    global shape_matrix;
    shape_matrix=shape_matrix_value; 
    T = 24; %  hrs to simulate
    global plazalength;
    plazalength=Y;%
 
    paths=path_line(B,m,L);  
    plaza = create_plaza(B,L);
    tem=plaza;
    %====================================================
    h = show_plaza(plaza,B,NaN);
    %xlabel(['P=0.1926' ' W=517.5000' ' T=728']);  
    %pause;
    %====================================================
    entry_vector = create_entry(T,B,number_T,lamda);
    %entry_vector
    accident_P=[];
    
    for i = 1:number_T
        plaza = move_forward(plaza,Vmax,autoVmax,paths); %move cars forward
        plaza = new_cars(plaza, entry_vector(i),ak,bm,Vmax,autoVmax); %allow new cars to enter
        accident_P=[accident_P compute_accident(plaza,Vmax,autoVmax,paths)];
        %plaza
        %===============================================
        if draw == 1
            h = show_plaza(plaza,B,h);                     %
            drawnow 
            %pause(1);
        end
        %===============================================
        plaza = clear_boundary(plaza);
    end
    %show_plaza(plaza,B,h); 
    average_P=sum(accident_P)/length(accident_P);
    %Different_P(j)=average_P;
    %xlabel(['Probability of accident is ' num2str(average_P)]);
end
W=sum(entry_vector)/24;
%show_plaza(tem,B,h);
xlabel(['P=' num2str(average_P)  ' T=' num2str(W*60) ' W=' num2str(cost)]);
end
