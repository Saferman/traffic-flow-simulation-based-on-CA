clear;clc;
min_y=Inf;
B=9;
L=3;
initial=[];
for Y=15:21
    for x3=1:Y-2
        for x2=1:x3
            for x1=1:x2
                [P,cost,T]=cellularF(Y,[3 3 3],24,L,B,[x3 x2 x1 0 0 0 x1 x2 x3],10.1,4,8);
                y=(4*Y*B+4*B-cost)/(4*Y*B+4*B-(48+4*B+4*(B-6)*Y))+(T-538.9583)/(539.2917-538.9583)+P;
                if y<min_y
                    min_y=Inf;
                    initial=[Y x3 x2 x1];
                end
            end
        end
    end
end
%%[15 13 13 13]
   