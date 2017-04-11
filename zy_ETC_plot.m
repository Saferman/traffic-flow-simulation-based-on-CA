B=9;
L=3;
p=[];
c=[];
x=[];
y=[];

for b1=0:B
    for b2=0:B-b1
        x=[x b1];
        y=[y b2];
        b3=B-b1-b2;
        b1=b1/B;
        b2=b2/B;
        b3=b3/B;
        [P,C,~]=cellularF(21,[1 6 2],24,L,B,[5 2 1 0 0 0 1 2 5],8.1,10.2,0,4,[b1 b2 b3],10,5,5,10000);
        p=[p P];
        c=[c C];
    end
end
save ETC x y p c;






