clear all;
W = 0;
%Different_P=zeros(1,7);
Y=15:21;
for j = 6
    B = 9; %number booths
    global shape_matrix;
    shape_matrix=[0 0 0 1 1 7 7 13 13]; 
    L = 3;  %number lanes in highway after plaza
    T = 24; %  hrs to simulate
    number_T= T*60;%number_T=T*1440;
    global plazalength;
    plazalength=Y(j);%plazalength = 20;
    m=[3 3 3];  
    Vmax= 10.1;
    paths=path_line(B,m,L);  
    
    plaza = create_plaza(B,L);
    %tem=plaza;
    %====================================================
    h = show_plaza(plaza,B,NaN);                       %    
    %pause;
    %====================================================
    entry_vector = create_entry(T,B,number_T);
    %waiting_time = 0;
    %output = 0;

    accident_P=[];
    
    for i = 1:number_T
        plaza = move_forward(plaza,Vmax,paths); %move cars forward
        plaza = new_cars(plaza, entry_vector(i)); %allow new cars to enter
        accident_P=[accident_P compute_accident(plaza,Vmax,paths)];
        %plaza = switch_lanes(plaza); %allow lane changes
        %compute waiting time during timestep i
        %waiting_time = waiting_time + compute_wait(plaza); 
        %output = output + compute_output(plaza);
        %===============================================
        %h = show_plaza(plaza,B,h);                     %
        %drawnow 
        %pause(2);
        %===============================================
        plaza = clear_boundary(plaza);
    end
    %show_plaza(plaza,B,h); 
    average_P=sum(accident_P)/length(accident_P);
    %Different_P(j)=average_P;
    %xlabel(['Probability of accident is ' num2str(average_P)]);
end


