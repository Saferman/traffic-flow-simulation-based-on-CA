t=[];
for Y=15:21
    [~,~,T]=cellularF(Y,[3 3 3],24*60,3,9,[5 2 1 0 0 0 1 2 5],10.1,10.2,0,4,[0 4 5],8,5,5,10000);
    t=[t T];
end
plot(15:21,t,'g-'),xlabel('Y'),ylabel('T'),grid on;
