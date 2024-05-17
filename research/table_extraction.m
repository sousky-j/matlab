%3_10,4_11,9_1은 데이터 오류입니다
%sampling frequency: 1000, t=1ms
folderPath='data_tuning';%파일 경로 호출
files = dir(fullfile(folderPath, '*.mat'));%폴더 내 mat 파일 모두 호출
for k = 1:length(files)
    % 현재 파일의 전체 경로
    filePath = fullfile(folderPath, files(k).name);
    loadedData = load(filePath);
    if isfield(loadedData, 'data')
        X = loadedData.data;
    columns_to_delete = 8:14;%제거 열
        X(:,columns_to_delete) = [];%8~14열 제거
    data = X;
    save(filePath, 'data');%파일 저장
    else
        warning('%s 파일 내에 data 변수가 없습니다.', files(k).name);
    end
end