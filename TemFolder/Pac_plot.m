probability=[0.1 0.3 0.5 0.7 0.9];
d=[0:0.025:1];
Pac=zeros(length(probability),length(d));
for i=1:length(probability)
    p=probability(i);
    Pac(i,:)=(((1-p).*(3.*d-2.*d.^2)-1)-((1-p).*d-1).*sqrt(1-4.*(1-p).*d.*(1-d)))./(2.*(1-p).*d.^2);
end
figure;
hold on;
plot(d,Pac(1,:),'-o',d,Pac(2,:),'-x',d,Pac(3,:),'-+',d,Pac(4,:),'-*',d,Pac(5,:),'-.');
legend('p=0.1','p=0.3','p=0.5','p=0.7','p=0.9','Location','NorthWest');    
    
