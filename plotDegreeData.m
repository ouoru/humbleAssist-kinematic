formatDegreePlot()
tempLegend = [];

for i=2:nCol
    if (contains(headers(i), 'inverted'))
    else
        tempLegend = [tempLegend, headers(i)];
        plot(rawData(:,1), rawData(:,i))
    end
end

legend(tempLegend,'Location','EastOutside');
