%LU factorization
function [L, U] = slu(A)
tol = 1.e-6;%정밀도 설정(10의 -6제곱)
[rows, cols] = size(A); % A의 크기 추출
if(rows~=cols)%행과 열 크기가 다른 경우
    error('this isnt square matrix')
end
L=eye(cols);%L을 단위 행렬로 만듬
U = zeros(cols);%U를 영행렬로 만듬
for j= 1:cols
  if(abs(A(j,j))) <tol
      [max_id_rows, max_id_cols] = max(abs(A(j+1:cols, j)));
      if max_id_rows == 0 % 행렬 A가 singular할 경우
             error('행렬 A는 비가역적이다');
      end
      [A(j,:), A(max_id_cols+j,:)] = deal(A(max_id_cols+j,:), A(j,:)); % 행 교환을 수행
      [L(j,1:j-1), L(max_id_cols+j,1:j-1)] = deal(L(max_id_cols+j,1:j-1), L(j,1:j-1)); % L에서도 대응하는 행을 교환
  end %diagonal elements가 0이 있으면 LU factorization이 안됨
    for i = j + 1 : cols 
        L(i, j) = A(i, j)/ A(j, j); % j열의 원소들에 대한 j열의 스칼라값을 계산하여 L의 i행 j열 원소에 대입
        for k = j + 1 : cols % i행, j열의 여인수 행렬에 대한 연산
            A(i, k) = A(i, k) - L(i, j) * A(j, k);  % A 행렬 i,j 인덱스 원소를 계산
        end 
    end
    U(j, j:cols) = A(j, j:cols);  % j행 계산 후 결과를 U에 저장
end 

end
