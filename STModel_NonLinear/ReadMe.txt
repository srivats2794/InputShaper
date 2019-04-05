Single track model also called as the non-linear bicycle model. 
Lumped vehicle dynamics with 3 dof (X, Y translational and yaw rotational)
Tire forces model (Pacjeka) included. 
Discrete time model with euler forward integration. 
Fine enough step time selected to make euler work well. 
Can be compiled into real time code. 

Reference:
Berntorp, K., Olofsson, B., Lundahl, K., & Nielsen, L. (2014). 
Models and methodology for optimal trajectory generation in safety-critical road-vehicle manoeuvres. 
Vehicle System Dynamics, 52(10), 1304–1332. https://doi.org/10.1080/00423114.2014.939094

Required Data: 

(Fill your own data here and then load it onto your workspace. 
The terms will make sense once you go through the above-mentioned paper which also has relevant data)

clc; clear;
%% Vehicle data
Ts= 0.001; Tsmall= 0.001;  m=; g=9.81;  
l_f= ; l_r= ; l=l_f+l_r; C_alpha_f= ; C_alpha_r= ;
Iz= ;Re= ; Rw= ; Iw= ; sigma= ;

l_p= Iz/(m*l_r);
%% Torque calculation

Ww= m/4; Csf= 0.022; RR= m*Csf; 

%% Initial conditions
Px0=0; Py0=0; psi0=0; Vx0= 10; omega_f0= 29.1545; psi_dot0=0; Vy0=0;
omega_r0= ; alpha_f0= 0; alpha_r0=0;

%% Road condition

road=1; %Toggle between 1 to 4 for Dry ashphalt, wet ashphalt, snow and ice.

%% Pacjeka parameters for Dry ashphalt, wet ashphalt, snow and smooth ice

% Ashpalt Front
mu_x_ash_f=  ;
mu_y_ash_f= ;
Bx_ash_f= ;
By_ash_f= ;
Cx_ash_f= ;
Cy_ash_f= ;
Ex_ash_f= ;
Ey_ash_f= ;

% Ashpalt rear
mu_x_ash_r= ;
mu_y_ash_r= ;
Bx_ash_r= ; 
By_ash_r= ; 
Cx_ash_r= ;
Cy_ash_r = ;
Ex_ash_r= ; 
Ey_ash_r= ; 

% Snow front
mu_x_snow_f= ;
mu_y_snow_f= ;
Bx_snow_f = ; 
By_snow_f= ;
Cx_snow_f= ; 
Cy_snow_f= ; 
Ex_snow_f= ; 
Ey_snow_f= ;

% Snow rear
mu_x_snow_r = ;
mu_y_snow_r= ;
Bx_snow_r= ;
By_snow_r= ;
Cx_snow_r= ;
Cy_snow_r= ; 
Ex_snow_r = ;
Ey_snow_r= ; 

% Wet ashphalt front
mu_x_wash_f= ;
mu_y_wash_f= ;
Bx_wash_f = ; 
By_wash_f= ;
Cx_wash_f= ; 
Cy_wash_f= ; 
Ex_wash_f= ; 
Ey_wash_f= ;

%Wet ashphalt rear
mu_x_wash_r = ;
mu_y_wash_r=;
Bx_wash_r= ;
By_wash_r= ;
Cx_wash_r= ;
Cy_wash_r= ; 
Ex_wash_r = ;
Ey_wash_r= ; 

% Smooth ice front
mu_x_ice_f= ;
mu_y_ice_f= ;
Bx_ice_f = ; 
By_ice_f= ;
Cx_ice_f= ; 
Cy_ice_f= ; 
Ex_ice_f= ; 
Ey_ice_f= ;

% Smooth ice rear
mu_x_ice_r = ;
mu_y_ice_r=;
Bx_ice_r= ;
By_ice_r= ;
Cx_ice_r= ;
Cy_ice_r= ; 
Ex_ice_r = ;
Ey_ice_r= ; 
