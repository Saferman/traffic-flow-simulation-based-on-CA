function A=symmetry(A)
[m,n]=size(A);
for i=1:m
    for j=1:(n-i)
        A(n+1-j,n+1-i)=A(i,j);
    end
end
end