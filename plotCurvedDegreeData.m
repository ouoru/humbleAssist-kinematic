formatDegreePlot()
tempLegend = [];

for i=2:nCol
    if (contains(headers(i), 'inverted'))
    else
        tempLegend = [tempLegend, headers(i)];
        plot(curvedDegData(:,1), curvedDegData(:,i));
    end
end

legend(tempLegend,'Location','EastOutside');
