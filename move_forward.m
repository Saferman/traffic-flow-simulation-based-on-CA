function plaza = move_forward(plaza,Vmax,autoVmax,paths)
dec_p = [0.5 0.25];%The first is the deceleration probability with velocity
%0, the second is the deceleration probability with speed greater than 0, the former requires more than the latter
have_moved=[];
flag=0;
%Paths is a 1xB-dimensional cell, each element is an Nx2-dimensional path 
%in plaza coordinates of each line is a point of the row, column coordinates
for i=1:length(paths)
    one_path=paths{i};
    for j=length(one_path):-1:1
        [move_r,~]=size(have_moved);
        for move=1:move_r %Determine whether this lattice is the place where the moving car arrives
            %Do not use length here, when only 1x2 dimension when the length returns 2
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
        %jDiscuss the case of the jth box on the one_path line
        v=plaza(one_path(j,1),one_path(j,2)); 
        if v==0  
            continue;
        else
            %%%%%%%%%%%%%%%%
%             d=0;
%             for k=1:length(one_path)-j
%                 if plaza(one_path(k+j,1),one_path(k+j,2))==0
%                     d=d+1;
%                 else
%                     break
%                 end
%                 if k==(length(one_path)-j)
%                     d=Inf;
%                 end
%             end
%             if (length(one_path)-j)==0
%                 d=Inf;
%             end
%             v=min(v+1,Vmax);
%             v=min(v,d+0.1);
%             if (v-1)==0.1
%                 if rand<dec_p(0)
%                     v=max(v-1,0.1);
%                 end
%             else
%                 if rand<dec_p(1)
%                     v=max(v-1,0.1);
%                 end
%             end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %Get one_path in front of the distance, if there is no car in front, and return to Inf
            [d,~,~]=detect_d(plaza,one_path,j);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%updating speed
            if (v-floor(v))<0.15%==(Vmax-floor(Vmax))
               v=v_update(v,Vmax,d,dec_p);
            else if (v-floor(v))<0.25%==(autoVmax-floor(autoVmax))
                    v=v_update(v,autoVmax,d,dec_p);
                end
            end
            %%%%%%%%%%%%%%%%%%
            if (j+floor(v))>length(one_path)
                plaza(one_path(j,1),one_path(j,2))=0;
            else
                plaza(one_path(j,1),one_path(j,2))=0;
                plaza(one_path(j+floor(v),1),one_path(j+floor(v),2))=v;
                have_moved=[have_moved;[one_path(j+floor(v),1),one_path(j+floor(v),2)]];
            end
        end
       
    end
end

                
            

