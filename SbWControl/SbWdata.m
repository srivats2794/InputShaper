clc; clear;
%% Vehicle data
Ts= 0.001; Tsmall= 0.001;  m=1830; g=9.81; h= 0.5; epsilon= 0.4;sigma= epsilon;
l_f= 1.2110; l_r= 1.4590; l= l_f+l_r;
Ixx= 602.1923; Iyy= 2.7370e+03; Izz= 3070; Iz= Izz;
K_phi= 178000; K_theta= 363540; D_phi= 16000; D_theta= 30960;
w= 0.7700; Rw= 0.3430; Re=Rw; Iw= 4; l_p= Iz/(m*l_r);

%% Initial conditions
Px0=0; Py0=0; psi0=0; Vx0= 10; omega_f0= 29.1545; psi_dot0=0; Vy0=0;
omega_r0= 29.1545; alpha_f0= 0; alpha_r0=0; omega0= 29.1545; delta_r= 0;

%% Road condition
road=1; %Toggle between 1 to 4 for Dry ashphalt, wet ashphalt, snow and ice.

%% Rajamani Controller
Ksbw=1; 

%% Input Shaper

%% Pacjeka parameters for Dry ashphalt, wet ashphalt, snow and smooth ice
% Ashpalt Front
mu_x_ash_f= 1.20 ;
mu_y_ash_f= 0.935;
Bx_ash_f= 11.7;
By_ash_f= 8.86;
Cx_ash_f= 1.69;
Cy_ash_f= 1.19;
Ex_ash_f= 0.377;
Ey_ash_f= -1.21;

% Ashpalt rear
mu_x_ash_r= 1.20;
mu_y_ash_r= 0.961;
Bx_ash_r= 11.1; 
By_ash_r= 9.30; 
Cx_ash_r= 1.69;
Cy_ash_r = 1.19;
Ex_ash_r= 0.362; 
Ey_ash_r= -1.11; 

% Snow front
mu_x_snow_f= 0.407;
mu_y_snow_f= 0.383;
Bx_snow_f = 10.2; 
By_snow_f= 19.1;
Cx_snow_f= 1.96; 
Cy_snow_f= 0.550; 
Ex_snow_f= 0.651; 
Ey_snow_f= -2.1;

% Snow rear
mu_x_snow_r = 0.409;
mu_y_snow_r= 0.394;
Bx_snow_r= 9.71;
By_snow_r= 20.0;
Cx_snow_r= 1.96;
Cy_snow_r= 0.550; 
Ex_snow_r = 0.624;
Ey_snow_r= -1.93; 

% Wet ashphalt front
mu_x_wash_f= 1.06;
mu_y_wash_f= 0.885;
Bx_wash_f = 12; 
By_wash_f= 10.7;
Cx_wash_f= 1.80; 
Cy_wash_f= 1.07; 
Ex_wash_f= 0.313; 
Ey_wash_f= -2.14;

%wet ashphalt rear
mu_x_wash_r = 1.07;
mu_y_wash_r= 0.911;
Bx_wash_r= 11.5;
By_wash_r= 11.3;
Cx_wash_r= 1.80;
Cy_wash_r= 1.07; 
Ex_wash_r = 0.300;
Ey_wash_r= -1.97; 

% Smooth ice front
mu_x_ice_f= 0.172;
mu_y_ice_f= 0.162;
Bx_ice_f = 31.1; 
By_ice_f= 28.4;
Cx_ice_f= 1.77; 
Cy_ice_f= 1.48; 
Ex_ice_f= 0.710; 
Ey_ice_f= -1.18;

% Smooth ice rear
mu_x_ice_r = 0.173;
mu_y_ice_r= 0.167;
Bx_ice_r= 29.5;
By_ice_r= 30;
Cx_ice_r= 1.77;
Cy_ice_r= 1.48; 
Ex_ice_r = 0.681;
Ey_ice_r= -1.08; 