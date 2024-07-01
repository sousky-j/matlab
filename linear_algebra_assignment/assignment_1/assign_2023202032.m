% #Question 1
%행렬 크기 입력 받기
i=input('행 크기를 입력하세요 (3 초과 20 이하): '); %행 크기 입력 받기
j=input('열 크기를 입력하세요 (3 초과 20 이하): '); %열 크기 입력 받기

while i<=3 || i>20 || j<=3 || j>20 %행렬 크기 조건 확인
    disp('행과 열의 크기는 각각 3 초과, 20 이상이여야 한다.') %유효한 출력 조건 확인 멘트 출력
    i=input('행 크기를 입력하세요 (3 초과 20 이하): '); %행 크기 입력 받기
    j=input('열 크기를 입력하세요 (3 초과 20 이하): '); %열 크기 입력 받기
end %종료 선언

disp('#Question 1') %1번 문제 코멘트 출력
disp('입력받은 i,j:') %출력 코멘트 출력
disp(i)%행 크기 i 출력
disp(j)%열 크기 j 출력

% #Question 2
A = 2*rand(i, j)-1;%[-1, 1] 범위 균일 분포 랜덤 행렬 생성
disp('#Question 2') %2번 문제 코멘트 출력
disp('[-1,1] 균일 분포 랜덤 행렬 A:');%A 출력 코멘트 출력
disp(A);%행렬 A 출력

% #Question 3
for row = 1:i%각 행마다 연산
    if mod(row, 2) == 0%짝수 행
        % 짝수 행의 요소들을 오름차순으로 정렬
        for k = 1:j-1%첫 열부터 j-1열까지
            for l = k+1:j%k의 다음 열부터 j열까지
                if A(row, k) > A(row, l)%앞의 값이 클 시 스왑 제어
                    temp = A(row, k);%임시 변수 저장
                    A(row, k) = A(row, l);%k인덱스값에 l인덱스값 대입
                    A(row, l) = temp;%임시 변수값 대입
                end %종료 선언
            end %종료 선언
        end %종료 선언
    else % 홀수 행
        % 홀수 행의 요소들을 내림차순으로 정렬
        for k = 1:j-1%첫 열부터 j-1열까지
            for l = k+1:j%k의 다음 열부터 j열까지
                if A(row, k) < A(row, l)%앞의 값이 작을 시 스왑 제어
                    temp = A(row, k);%임시 변수 저장
                    A(row, k) = A(row, l);%k인덱스값에 l인덱스값 대입
                    A(row, l) = temp;%임시 변수값 대입
                end %종료 선언
            end %종료 선언
        end %종료 선언
    end %종료 선언
end %종료 선언
disp('#Question 3') %3번 문제 코멘트 출력
disp('정렬된 행렬 A:')%출력 코멘트 출력;
disp(A); %행렬 A 출력

% Question 4
B=randn(i,j); %평균 0, 분산 1 정규 분포 랜덤 행렬 생성
disp('#Question 4') %4번 문제 코멘트 출력
disp('정규 분포 랜덤 행렬 B:'); %출력 코멘트 출력
disp(B); %행렬 B 출력


% Question 5
C= -1*ones(i,j); %C행렬 생성, -1로 초기화
C((A >= B) & (A > 0)) = 1; %1번 condition
disp('#Question 5') %5번 문제 코멘트 출력
disp('행렬 C:'); %출력 코 멘트 출력
disp(C) %행렬 C 출력

% Question 6
% 행렬에서 최댓값을 포함하는 행과 최솟값을 포함하는 열 제거
% A에서 최댓값을 포함하는 행 제거
max_val=max(A,[],"all");%최댓값 찾기
min_val=min(A,[],"all");%최솟값 찾기
[maxid_rows,~]=find(A==max_val);%최댓값 인덱스 찾기
[~,minid_cols]=find(A==min_val);%최솟값 인덱스 찾기
A(maxid_rows,:)=[];%행 제거
A(:,minid_cols)=[];%열 제거

max_val=max(B,[],"all");%최댓값 찾기
min_val=min(B,[],"all");%최솟값 찾기
[maxid_rows,maxid_cols]=find(B==max_val);%최댓값 인덱스 찾기
[minid_rows,minid_cols]=find(B==min_val);%최솟값 인덱스 찾기
B(maxid_rows,:)=[];%행 제거
B(:,minid_cols)=[];%열 제거

disp('#Question 6') %6번 문제 코멘트 출력
disp('최댓값 행, 최솟값 열 제거 A:')%출력 코멘트 출력
disp(A)%A 출력
disp('최댓값 행, 최솟값 열 제거 B:')%출력 코멘트 출력
disp(B)%B 출력

% #Question 7
D=A*B'; %D행렬 생성
D=rot90(D,3); %D를 왼쪽으로 3*90 회전(=오른쪽으로 90회전)
disp('#Question 7') %7번 문제 코멘트 출력
disp('A와 B transpose의 곱, 오른쪽으로 90도 회전 행렬 D:') %출력 코멘트 출력
disp(D) %A,B'의 행렬곱 D 출력

% #Question 8
k=sum(C,2); %각 행의 합으로 열 벡터 k 생성
m=sum(C,1); %각 열의 합으로 행 벡터 m 생성
disp('#Question 8') %8번 문제 코멘트 출력
disp('k vector:')%출력 코멘트 출력
disp(k) %k 벡터 출력
disp('m vector:')%출력 코멘트 출력
disp(m) %m 벡터 출력

% #Question 9
r=[k',m]; %r을 행 벡터로 생성
r=r'; %행에서 열 벡터로 전치
disp('#Question 9') %9번 문제 코멘트 출력
disp('r vector:')%출력 코멘트 출력
disp(r) % 생성한 r 벡터 출력

% #Question 10
mean_r=sum(r)/numel(r); %평균 계산 (합/표본 수)
sort_r=r; %정렬 r 복사

for k = 1:numel(sort_r)-1%첫 열부터 numel(r)-1열까지
            for l = k+1:numel(sort_r)%k의 다음 열부터 numel(r)열까지
                if sort_r(k) > sort_r(l)%앞의 값이 클 시 스왑 제어
                    temp = sort_r(k);%임시 변수 저장
                    sort_r(k)=sort_r(l); %k인덱스값에 l인덱스값 대입
                    sort_r(l)=temp;%임시 변수값 대입
                end %종료 선언
            end %종료 선언
end %종료 선언

if mod(numel(r),2)==0 %짝수 크기일 때 조건
    median_r=(sort_r(numel(r)/2)+sort_r(numel(r)/2+1))/2; %짝수 크기일 떄 중앙값 (두 값의 합)/2
else%홀수 크기일 때
    median_r=sort_r(numel(r)/2+0.5);%홀수 크기일 때 중앙값
end%종료 선언

variance_r=sum((r-mean_r).^2)/numel(r); %분산 계산 (편차제곱/표본 수)
std2ev_r=sqrt(variance_r); %표준편차 계산(루트(분산))

disp('#Question 10') %10번 문제 코멘트 출력
disp('평균:') %평균 코멘트 출력
disp(mean_r) %평균 출력
disp('중앙값:') %중앙값 코멘트 출력
disp(median_r) %중앙값 출력
disp('분산:') %분산 코멘트 출력
disp(variance_r) %분산 출력
disp('표준편차:') %표준편차 코멘트 출력
disp(std2ev_r) %표준편차 출력