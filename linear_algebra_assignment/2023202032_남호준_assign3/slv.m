% forward backward
function x = slv(A, b)         
 % Forward substitution
[L, U] = slu(A);
[~,cols]=size(A);
a=zeros(cols,1);%a 벡터를 영 벡터로 초기화
x=zeros(cols,1);%x 벡터를 영 벡터로 초기화
sum=0;
for i=1:cols
    for j=1:i-1
    sum = sum + L(i, j) * a(j); %이전 합계에 a[j]와 L[i,j]의 곱을 더함
    end
    a(i) = (b(i) - sum) / L(i, i);
    sum=0;
end
 % Backward substitution
t=0;
for i = cols : -1 : 1 % x(n)에서부터 x(1)까지 역순으로 진행
    for j = i+1:cols % Back substitution
        t = t + U(i, j) * x(j); % U와 이후 x(j)를 곱해서 더함
    end
    x(i) = (a(i) - t)/ U(i, i); % 피벗으로 나눔
    t = 0; %다음 i 이전 t reset
end
x = x'; % 열벡터로 transpose함
end