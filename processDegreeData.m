%rawData is defined in the README.m 
[nRow, nCol] = size(rawData);
theta = zeros(nCol-1, degree);

for i=1:(nCol-1)
    X = zeros(nRow, degree);
    for k = 1:nRow
        tempArr = zeros(1, degree);
        tempArrHelper = rawData(:,1);
        
        for j = 1:degree
            tempArr(j) = tempArrHelper(k)^(j-1);
        end
        X(k,:) = tempArr;
    end
    
    tempOutputs = rawData(:,i+1);
    theta(i,:) = (X.'*X)\X.'*tempOutputs;
end
