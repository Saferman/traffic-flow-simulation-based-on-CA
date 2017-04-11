clear;clc;
load accident_data;
ratio=polyfit(Y,Different_P,3);
plot(Y,Different_P,'r-',Y,polyval(ratio,Y),'b-');
grid on; 
xlabel('Y'),ylabel('P')