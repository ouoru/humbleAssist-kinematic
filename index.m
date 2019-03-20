%Sets some constants
degree = 4;
steps = 100000;

%Dataset to analyze
filename = 'rawData/kevinArmrest.xlsx';
[rawData, headers] = xlsread(filename);
totalTime = 7.2;

%Test Subject
height = 1.79; %m
mass = 134 / 2.20462; %kg

%Imports degree data and solves for thetas
processDegreeData()

%Processes the discretized degree data (DDD)
curveDegreeData()

%Uses DDD to get (X,Y) data of segments
processSegmentData()

%get MomentOfInertia for shank & thigh
calculateMOI()

%calculate knee torque
%calculateKneeTorque()

%Plotting functions
%plotDegreeData()
%plotCurvedDegreeData()
%plotBodyAnimation()

%plot() formatting
%formatDegreePlot()

%{
READ.ME document

Data needs to correspond to Segments:
- Foot
- Shank
- Thigh
- Trunk
- Upper Arm
- Forearm
- Hand
- Hand (inverted)
- Forearm (inverted)
- Upper Arm (inverted)
- Neck & Head

Pure sit: 0.8s -> 3.2s
- total 2.4s
Armrest: 0 -> 7.2s
- total 7.2s
%}