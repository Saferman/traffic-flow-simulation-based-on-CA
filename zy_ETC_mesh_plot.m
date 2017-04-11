clear;
clc;
B=9;
L=3;
b1=[0 1 2 3 4 5 6 7 8 9];
b2=[0 1 2 3 4 5 6 7 8 9];
[B1,B2]=meshgrid(b1,b2);
B1=symmetry(B1)./B;
B2=symmetry(B2)./B;
B3=(ones(10)*9-B1-B2)./B;
%pause;
ZP=zeros(10);
ZC=zeros(10);
for i=1:10
    for j=1:(11-i)
        [ZP(i,j),ZC(i,j),~]=cellularF(21,[1 6 2],24,L,B,[5 2 1 0 0 0 1 2 5],10.1,10.2,0,4,[B1(i,j) B2(i,j) B3(i,j)],10,5,5,10000);
    end
end
save ETC_matrix B1 B2 B3 ZP ZC

%Conventional tollbooths proportion
%Exacat-change tollbooths proportion






