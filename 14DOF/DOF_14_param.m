%Vehicle Parameters
%------------------
%Time Step
Ts= 0.001; %s
%Sprung mass 
m = 1440; %kg
%Sprung mass roll inertia 
Jx = 900; %kgm2
%Sprung mass yaw inertia 
Jy = 2000; %kgm2
%Sprung mass pitch inertia 
Jz = 2000; %kgm2
%Distance of sprung mass c.g. from front axle 
a = 1.016; %m
%Distance of sprung mass c.g. from rear axle 
b = 1.524; %m
%Sprung mass c.g. height 
h = 0.75; %m
%Front/rear track width 
cf = 1.5; cr=cf; %m
%Front suspension stiffness 
ksf = 35000 ; %N/m
%Front suspension damping coefficient 
bsf = 2500; %Ns/m
%Rear suspension stiffness 
ksr = 30000; %N/m
%Rear suspension damping coefficient 
bsr = 2000; %Ns/m
%Front/rear unsprung mass 
muf = 80; mur=muf; mu= muf+mur;%kg
%Front/rear tire stiffness 
ktf = 200000; ktr=ktf; %N/m
%Nominal tire radius 
ro = 0.285; %m
%Tire/wheel roll inertia 
Jw = 1; %kgm2
%Front roll center distance below sprung mass c.g. 
hrcf = 0.65; %m
%Rear roll center distance below sprung mass c.g. 
hrcr = 0.6; %m

x_sif= ((m*b)/(2*(a+b)*ksf)); %Initital spring compression
x_tif= ((0.5*m*b*(a+b))+muf)/ktf; %Initial tire compression
l_sif= h-(ro-x_tif); %Initial strut length