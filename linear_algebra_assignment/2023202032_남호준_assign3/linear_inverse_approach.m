n=20; % data point & frequency size
t=0.01; % time segment
A=zeros(n); % send sinusoidal signals data matrix
for i=1:n % time loop
    for j=1:n % frequency loop
        X=cos(2*pi*(j+10)*t*i); % sinusoidal signals
        A(i,j)=X; % 행렬에 대입
    end % end
end % end
x = slv(A,output); % 20 calculated absorption rates
x=x'; % row vectror to column vector
I=inv(A); % inverse matrix using built-in inv function
y=I*output; % find solution using built-in inv function
disp('손에 흐른 정현파 행렬 A:') % console print
disp(A) % console print
disp('발 측정 신호 output:') % console print
disp(output) % console print
disp('20개 slv 사용 흡수율:')% console print
disp(x) % console print
disp('20개 inv 사용 흡수율:') % console print
disp(y)% console print