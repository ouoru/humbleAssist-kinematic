function [deltaData] = getDeltaData(data, tstep)
    deltaData = data;
    [rows, cols] = size(data);
    for i=2:cols
       for j=1:rows-1
           deltaData(j,i) = (data(j+1,i) - data(j,i)) / tstep;
       end
       deltaData(rows,i) = deltaData(rows-1,i);
    end
end

