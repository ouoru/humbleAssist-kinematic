figure
hold off
grid on
ylabel('Y');
xlabel('X');

for i=1:1000
    plot(segmentEndPosX(i*100, 2:end), segmentEndPosY(i*100, 2:end), 'b', wholeBodyCOMXY(i*100, 1), wholeBodyCOMXY(i*100, 2), 'c*');
    axis([-1 1 -0.2 2])
    daspect([1 1 1])
    pause(0.001)
end

