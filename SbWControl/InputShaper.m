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
Px0=0; Py0=0; psi0=0; Vx0= 22.22; omega_f0= Vx0/Rw; psi_dot0=0; Vy0=0;
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

%Bicycle sim
for i = 1:samplePoints-1
    % Passing driver input through time delay filter
        deltaSW_RAW_history = [deltaSW_RAW_history, deltaSW_RAW_vec(i)]; %appending current steering wheel input
        %to steering wheel angle history
    %calculating natural frequency and damping ratio of bicycle model.
        %these parameters depend on 'Velocity', the current tangential CG velocity
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
        
        %the filtered steering wheel angle
        deltaSW = A1*deltaSW_RAW_vec(i)+A2*deltaSW_RAW_history(end-round(t2/dt)); %here need time step duration 'dt' defined,
        %so we know which index of steering wheel history to access
        thetaSW_actual = [thetaSW_actual, deltaSW];
    
    delta= (1/20)*thetaSW_actual(i);
    Fzf= (m*g*l_r)/l; Fzr= (m*g*l_f)/l;
    Vxf_unrotated= Vx0; Vxr_unrotated= Vx0; 
    Vyf_unrotated= Vy0+(l_f*psi_dot0); Vyr_unrotated= Vy0-(l_r*psi_dot0);
    R_f = [ cos(delta) -sin(delta);
    sin(delta) cos(delta)  ];
    Vf_xy= R_f*[Vyf_unrotated; Vxf_unrotated];
    Vr_xy= [Vyr_unrotated; Vxr_unrotated];
    Vxf= Vf_xy(2); Vyf= Vf_xy(1); Vxr= Vr_xy(2); Vyr= Vr_xy(1);
    kf= ((Rw*omega_f0)-Vxf)/Vxf; kr= ((Rw*omega_r0)-Vxr)/Vxr; %slip ratios
    alpha_dot_f= (-atan((Vyf/Vxf))-alpha_f0)*(Vxf/sigma);% slip angles
    alpha_dot_r= (-atan((Vyr/Vxr))-alpha_r0)*(Vxr/sigma); %slip angles
    Fx0f= mu_x_ash_f*Fzf*sin(Cx_ash_f*atan((Bx_ash_f*kf)-(Ex_ash_f*((Bx_ash_f*kf)-atan((Bx_ash_f*kf))))));
    Fx0r= mu_x_ash_r*Fzr*sin(Cx_ash_r*atan((Bx_ash_r*kr)-(Ex_ash_r*((Bx_ash_r*kr)-atan((Bx_ash_r*kr))))));
    Fy0f= mu_y_ash_f*Fzf*sin(Cy_ash_f*atan((By_ash_f*alpha_f0)-(Ey_ash_f*((By_ash_f*alpha_f0)-atan((By_ash_f*alpha_f0))))));
    Fy0r= mu_y_ash_r*Fzr*sin(Cy_ash_r*atan((By_ash_r*alpha_r0)-(Ey_ash_r*((By_ash_r*alpha_r0)-atan((By_ash_r*alpha_r0))))));
    
    Fyf_ur= Fy0f*(sqrt(1-((Fx0f/(mu_x_ash_f*Fzf))^2))); %Friction ellipse
    Fyr_ur= Fy0r*(sqrt(1-((Fx0r/(mu_x_ash_r*Fzf))^2))); %Friction ellipse
    
    Fxf= (Fx0f*cos(delta))-(Fyf_ur*sin(delta));
    Fxr= Fx0r;
    Fyf= (Fyf_ur*cos(delta))+(Fx0f*sin(delta));
    Fyr= Fyr_ur;
    omega_dot_f= (Tf-(Fxf*Rw))/Iw;
    omega_dot_r= (Tr-(Fxr*Rw))/Iw;
    
    Fx= (Fxf+Fxr);
    Fy= (Fyf+Fyr);
    Mz= ((l_f*Fyf)-(l_r*Fyr));
    
    Vx_dot= (Fx/m)+(Vy0*psi_dot0); Vy_dot= (Fy/m)-(Vx0*psi_dot0);
    psi_ddot= Mz/Iz;
    
    Rpsi= [ cos(psi0) -sin(psi0);
    sin(psi0) cos(psi0)  ];
    
    Vxy= Rpsi*[Vx0;Vy0]; Vx_global= Vxy(1); Vy_global= Vxy(2);
    Pxy= Rpsi*[Px0;Py0]; Px_global= Pxy(1); Py_global= Pxy(2);
     
    %Euler forward. Ts= 0.001
    states= [psi_ddot; psi_dot0; Vx_dot; Vy_dot; omega_dot_f; omega_dot_r; alpha_dot_f; alpha_dot_r; Vx0; Vy0]*Ts+[psi_dot0;psi0;Vx0;Vy0;omega_f0; omega_r0;alpha_f0;alpha_r0; Px0; Py0];
    
    %resetting initial values for next timesteps.
    psi_dot0= states(1); psi0= states(2); Vx0= states(3); Vy0= states(4); omega_f0= states(5);
    omega_r0= states(6); alpha_f0= states(7); alpha_r0= states(8); Px0= states(9); Py0= states(10);
    Vxy_next= Rpsi*[Vx0;Vy0]; Vx_global= Vxy_next(1); Vy_global= Vxy_next(2);
    Pxy_next= Rpsi*[Px0;Py0]; Px_global= Pxy_next(1); Py_global= Pxy_next(2);
    Velocity= sqrt((Vx_global^2)+(Vy_global^2));
end      


