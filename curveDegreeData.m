%discretize
xi = 0;
xf = 1;
xstep = (xf-xi)/steps;
xnodes = steps + 1;

tstep = totalTime / steps;
xstep_arr = ((0:steps)*xstep);

y = zeros(1, xnodes);

curvedDegData = zeros(xnodes, nCol);
curvedDegData(:,1) = ((0:steps)*xstep).';

for i=1:(nCol-1)
    for k = 1:xnodes
        xValues = zeros(1, degree);
        for m = 1:degree
            xValues(m) = (k * xstep)^(m-1);
        end
        y(k) = xValues * theta(i,:).';
    end
    curvedDegData(:,i+1) = y;
end

curvedOmegaData = getDeltaData(curvedDegData, tstep);
curvedAlphaData = getDeltaData(curvedOmegaData, tstep);
