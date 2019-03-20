kneeTorque = zeros(1,nRow);

for i=1:nRow
   kneeTorque(i) = Iprox_shank * curvedAlphaData(i,3); 
end

hold on
grid on
xlim([0, 1]);
ylabel('Torque');
xlabel('Percent of Motion');

plot(xstep_arr, kneeTorque)