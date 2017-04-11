%x=0:20:200;
%y=[12500 12900 15000 17500 20000 25000 30000 40000 48000 60000 70000];
%ratio=polyfit(x,y,4);
%y1=polyval(ratio,x);
%plot(x,y1,'-')
%y2=0.02.*x.^3-1.31.*x.^2+90.29.*x+12181.82
%plot(x,y2,'-');

x=[0:1:10];
y=1-exp(-x);
figure;
%set(gca,'xtick',[0:0.5:10]);
%set(gca,'ytick',[0:0.1:1.5]);
plot(x,y,'-r');
text(2,0.86,'\leftarrow P=1-exp(-x)');
axis([0 10 0 1.5]);
legend('Pd2');
%grid on;  
xlabel('lamda');
ylabel('probability of being crashed by deris'); 
