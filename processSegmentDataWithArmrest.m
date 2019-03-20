filename = 'rawData/segmentData.xlsx';
segmentData = xlsread(filename);

%discretize
xi = 0;
xf = 1;
xstep = (xf-xi)/steps;
xnodes = steps + 1;

segmentData(:,1) = segmentData(:,1) * height / 100;
segmentData(:,2) = segmentData(:,2) * mass / 100;
segmentData(:,3) = segmentData(:,3) / 100;

[nRow, nCol] = size(curvedDegData);

emptyArr = [ ((0:steps)*xstep).' zeros(nRow, nCol-1) ];

segmentEndPosX = emptyArr;
segmentEndPosY = emptyArr;
segmentCOMPosX = emptyArr;
segmentCOMPosY = emptyArr;

wholeBodyCOMXY = zeros(nRow, 2);
kneeTorque = zeros(nRow, 1);

for i=1:nRow
    x = 0;
    y = 0;
    
    for j=2:nCol
        segmentLength = segmentData(j-1, 1);
        segmentMass = segmentData(j-1, 2);
        segmentLtoCOM = segmentData(j-1, 3);
        
        dx = segmentLength * cos(curvedDegData(i, j)*pi/180);
        dy = segmentLength * sin(curvedDegData(i, j)*pi/180);
        
        segmentEndPosX(i, j) = x + dx;
        segmentEndPosY(i, j) = y + dy;
        segmentCOMPosX(i, j) = x + dx * segmentLtoCOM;
        segmentCOMPosY(i, j) = y + dy * segmentLtoCOM;
        
        %Start adding up torque
        if j > 3
            kneeTorque(i) = kneeTorque(i) + (segmentMass * 9.81) * (segmentEndPosX(i, 3) - segmentCOMPosX(i, j));
            if j == 7
                kneeTorque(i) = kneeTorque(i) + (15 * 9.81) * (segmentEndPosX(i, j-1) + 0.5 * (segmentCOMPosX(i, j) - segmentEndPosX(i, j-1)) - segmentEndPosX(i, 3));
            end
            if j == 10
                kneeTorque(i) = kneeTorque(i) + (15 * 9.81) * (segmentEndPosX(i, j-1) + 1.38 * (segmentCOMPosX(i, j) - segmentEndPosX(i, j-1)) - segmentEndPosX(i, 3));
            end
        end
        
        x = x + dx;
        y = y + dy;
    end
    
    wholeBodyCOMXY(i, 1) = segmentCOMPosX(i,:) * [ 0; segmentData(:,2)] / sum(segmentData(:,2));
    wholeBodyCOMXY(i, 2) = segmentCOMPosY(i,:) * [ 0; segmentData(:,2)] / sum(segmentData(:,2));
end