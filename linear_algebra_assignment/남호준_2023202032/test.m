%계수 행렬 A와 벡터 b를 생성
size=100;
A = rand(size,size);%임의의 정사각 행렬로 만듬
b = rand(size,1);%임의의 열 벡터로 만듬

%LU Factorization의 연산 시간 측정
disp('LU Factorization 연산 시간:')
tic;
[L,U]=slu(A);%L,U 값
x_LUF=slv(A,b);% LU facto 의 해 구함
toc;

%가우스 소거법 연산 시간 측정
disp('가우스 소거법 연산 시간:')
tic;
x_gau=gauss_elim(A,b);
toc;
x_gau=x_gau';
disp('행렬 A:');
disp(A);
disp('벡터 b:');
disp(b);
disp('행렬 L:');
disp(L);
disp('행렬 U:');
disp(U);
disp('LU Factorization의 결과값:');
disp(x_LUF);
disp('가우스 소거법의 결과값:');
disp(x_gau);