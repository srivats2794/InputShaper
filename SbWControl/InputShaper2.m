clc; clear;

%% Vehicle data
Ts= 0.001; Tsmall= 0.001;  m=1830; g=9.81; h= 0.5; epsilon= 0.4;sigma= epsilon;
l_f= 1.2110; l_r= 1.4590; l= l_f+l_r;
Ixx= 602.1923; Iyy= 2.7370e+03; Izz= 3070; Iz= Izz;
K_phi= 178000; K_theta= 363540; D_phi= 16000; D_theta= 30960;
w= 0.7700; Rw= 0.3; Re=Rw; Iw= 4; l_p= Iz/(m*l_r);
Tf=0; Tr=0; %Driving/Braking torques
C_alpha_f= 1830*0.50*0.165*57.29578; % in kg/rad, taking cornering stiffness per rad 
%of slip angle as 16-17 percent of tire load. 
C_alpha_r= C_alpha_f; 
%% Initial conditions
Px0=0; Py0=0; psi0=0; Vx0= 16.67; omega_f0= Vx0/Rw; psi_dot0=0; Vy0=0;
omega_r0= Vx0/Rw; alpha_f0= 0; alpha_r0=0; omega0= Vx0/Rw; delta_r= 0;

Velocity= sqrt((Vx0^2)+(Vy0^2));

load("DLCTest.mat");

%% Road condition
road=1; %Toggle between 1 to 4 for Dry ashphalt, wet ashphalt, snow and ice.
pacjeka_params; 
%% Input Shaper
SWbuffer = 1e4; 
deltaSW_RAW_history = zeros(1,SWbuffer);
TF = 12.003; %final time [s]
samplePoints = TF/Ts+1; %number of sample points in simulation
tspanTotal = linspace(0,TF,samplePoints); %time span of simulation
deltaSW_RAW_vec = (DLCTest(:,1))';
CalphaF= 1830*0.50*0.165*57.29578; % in kg/rad, taking cornering stiffness per rad 
%of slip angle as 16-17 percent of tire load. 
CalphaR= CalphaF; 
t1=0;
thetaSW_actual = [];
a= l_f; b= l_r;
dt=Ts;
 a11 = -(CalphaR+CalphaF)/(m*Velocity); 
        a12 = (CalphaR*b-CalphaF*a)/(m*Velocity^2)-1;
        a21 = (CalphaR*b-CalphaF*a)/Iz;
        a22 = -(CalphaR*b^2+CalphaF*a^2)/(Iz*Velocity);
        b1 = CalphaF/(m*Velocity);
        b2 = CalphaF*a/Iz;
        om = sqrt(a11*a22-a12*a21); %natural frequency of bicycle model
        zeta = -(a11+a22)/(2*om); %damping ratio of bicycle model 
        omd = om*sqrt(1-zeta^2); %damped natural frequency of bicycle model
        Td = 2*pi/omd; %damped period of bicycle model
    %using properties of bicycle model to calculate time delay filter
        %parameters
        K = exp(-zeta*pi/sqrt(1-zeta^2));
        t1 = 0; %first time delay
        t2 = Td/2; %second time delay
        A1 = 1/(1+K); %amplification factor associated with first delay
        A2 = K/(1+K); %amplification factor associated with second delay
        
%Bicycle sim
for i = 1:samplePoints-1
    % Passing driver input through time delay filter
        deltaSW_RAW_history = [deltaSW_RAW_history, deltaSW_RAW_vec(i)]; %appending current steering wheel input
        %to steering wheel angle history
    %calculating natural frequency and damping ratio of bicycle model.
        %these parameters depend on 'Velocity', the current tangential CG velocity
       
        
        %the filtered steering wheel angle
        deltaSW = A1*deltaSW_RAW_vec(i)+A2*deltaSW_RAW_history(end-round(t2/dt)); %here need time step duration 'dt' defined,
        %so we know which index of steering wheel history to access
        thetaSW_actual = [thetaSW_actual, deltaSW];
    
end      

save ('thetaSW_IS_L', 'thetaSW_actual');
clc; clear;
