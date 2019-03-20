%Sets some constants
degree = 4;
steps = 100000;

%Dataset to analyze - pure sit
filename = 'rawData/kevinPureSit.xlsx';
[rawData, headers] = xlsread(filename);
totalTime = 2.4;

%Test Subject
height = 1.79; %m
mass = 134 / 2.20462; %kg

%Imports degree data and solves for thetas
processDegreeData()
%Processes the discretized degree data (DDD)
curveDegreeData()
%Uses DDD to get (X,Y) data of segments
processSegmentData()

kneeTorque_baseline = kneeTorque;

%Dataset to compare with - Armrest
filename = 'rawData/kevinArmrest.xlsx';
[rawData, headers] = xlsread(filename);
totalTime = 7.2;

%Imports degree data and solves for thetas
processDegreeData()
%Processes the discretized degree data (DDD)
curveDegreeData()
%Uses DDD to get (X,Y) data of segments
processSegmentDataWithArmrest()

kneeTorque_comparison = kneeTorque;

plot(xstep_arr, [kneeTorque_baseline, kneeTorque_comparison]);
ylabel('Torque (Nm)');
xlabel('Progress of Motion');
legend('Pure sit', 'Armrest');
