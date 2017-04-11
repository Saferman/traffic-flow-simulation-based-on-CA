function entry = create_entry(T,B,number_T,lamda)
k = linspace(0,T,number_T);
%lamda=10000;
%p=1-exp(-lamda*t);
entry=zeros(1,length(k));
interval=zeros(1,B);
for i=1:length(k)
    for j=1:B
        if rand<(1-exp(-lamda*interval(j)))
            entry(i)=entry(i)+1;
            interval(j)=1/(number_T);
        else
            interval(j)=interval(j)+1/(number_T);
        end
    end
end
%entry
end
 