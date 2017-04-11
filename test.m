c=[];
w=[];
Y=15:21;
for j=Y
    [average_P,cost,W]=cellularF(j,[3 3 3],24*60,3,9,[13 7 1 0 0 0 1 7 13],10.1,4,8);
    c=[c cost];
    w=[w W];
end
