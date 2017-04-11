function P=compute_accident(plaza,Vmax,autoVmax,paths)
%Returns the current time the accident car divided by the total number of cars
dec_p = [0.5 0.25];%The first is the deceleration probability with velocity
%0, the second is the deceleration probability with speed greater than 0, the former requires more than the latter
accident_cars=0;
have_moved=[];
flag=0;
for i=1:length(paths)
    one_path=paths{i};
    for j=length(one_path):-1:1
        [move_r,~]=size(have_moved);
        for move=1:move_r 
            if have_moved(move,:)==[one_path(j,1),one_path(j,2)]
                flag=1;
                break;
            end
        end
        if flag==1
            flag=0;
            continue;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        v=plaza(one_path(j,1),one_path(j,2)); 
        if v==0  
            continue;
        else
            %d=get_d(one_path,j);  
            [d,v_forward,j_forward]=detect_d(plaza,one_path,j);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if (v_forward-floor(v_forward))==(Vmax-floor(Vmax))
                if d<=Vmax
                    if v_forward~=(Vmax-floor(Vmax))
                        [d,~,~]=detect_d(plaza,one_path,j_forward);
                        v_forward=v_update(v_forward,Vmax,d,dec_p);
                        if v_forward==(Vmax-floor(Vmax))
                            accident_cars=accident_cars+1;
                        end
                    end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if (v_forward-floor(v_forward))==(autoVmax-floor(autoVmax))
                if d<=autoVmax
                    if v_forward~=(autoVmax-floor(autoVmax))
                        [d,~,~]=detect_d(plaza,one_path,j_forward);
                        v_forward=v_update(v_forward,autoVmax,d,dec_p);
                        if v_forward==(autoVmax-floor(autoVmax))
                            accident_cars=accident_cars+1;
                        end
                    end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            have_moved=[have_moved;[one_path(j,1),one_path(j,2)]];
        end
    end
end
[All_cars,~]=size(have_moved);
%P=accident_cars/All_cars;
P=(accident_cars+compute_horizontal_accident(plaza))/All_cars;
if P==Inf || isnan(P)
    P=0;
end
end