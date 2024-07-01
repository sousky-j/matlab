% Gauss elimination 
function x = gauss_elim(A, b)
tol = 1.e-6;%오차 정밀도 설정(10의 -6제곱의 오차)
Ab = [A, b];% Augmented matrix 만듬

[rows,cols]=size(A);%A의 행과 열 크기 가져옴
    % Forward elimination
    for i = 1:rows-1
        [~, maxRow] = max(abs(Ab(i:cols, i)));% 현재 열에서 최대 절대값을 가진 행 찾음
        maxRow = maxRow + i - 1;
        if abs(Ab(maxRow, i)) < tol % 최대값이 허용 오차보다 작은 경우
            error('피벗의 값이 너무 작음');
        end
        if maxRow~=i % 최대값이 현재 행이 아닌 경우
        Ab([i maxRow], :) = Ab([maxRow i], :); %행 교환
        end
        for j = i+1:cols
            factor = Ab(j, i) / Ab(i, i); % 소거 요소 연산
            Ab(j, :) = Ab(j, :) - factor * Ab(i, :); %행 소거
        end
    end
    
    % Backward substitution
    x = zeros(cols, 1); % 결과 벡터 초기화
    x(cols) = Ab(cols, cols+1) / Ab(cols, cols); % 마지막 열에 대한 값을 계산
    for i = cols-1:-1:1 % 역순 계산
        x(i) = (Ab(i, cols+1) - Ab(i, i+1:cols) * x(i+1:cols)) / Ab(i, i); % 현재 행 값 계산
    end
end
