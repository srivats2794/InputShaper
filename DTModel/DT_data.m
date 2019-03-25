Ts= 0.001; Tsmall= 0.001;  m=1830; g=9.81; h= 0.5; epsilon= 0.5; 
l_f= 1.2110; l_r= 1.4590;
Ixx= 602.1923; Iyy= 2.7370e+03; Izz= 3070; 
K_phi= 178000; K_theta= 363540; D_phi= 16000; D_theta= 30960;
w= 0.7700; road= 1; Rw= 0.3430; Iw= 4; 

%Initial conditions
Vx0= 10; omega0= 29.1545;

% Ashpalt Front
mu_x_ash_f= 1.20 *0.85;
mu_y_ash_f= 0.935 *0.85;
Bx_ash_f= 11.7;
By_ash_f= 8.86;
Cx_ash_f= 1.69;
Cy_ash_f= 1.19;
Ex_ash_f= 0.377;
Ey_ash_f= -1.21;

% Ashpalt rear
mu_x_ash_r= 1.20 *0.85;
mu_y_ash_r= 0.961 *0.85;
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

DELTA_OFFSET= 0.0175;
delta_r= 0;