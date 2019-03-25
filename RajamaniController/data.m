clc; clear;                                                                                                                                                                                                                                                                               

%% Data
m=1573;
Iz=2873;
lf=1.1;
lr=1.58;
C_alpha_f=80000;
C_alpha_r= 80000;
Vx= 30 ;%m/s
R= 1000; %m
%% System
B1_12= (2*C_alpha_f)/m;
B1_14= (2*C_alpha_f*lf)/Iz;
B2_12= (-((2*C_alpha_f*lf)+(2*C_alpha_r*lr)/(m*Vx))-Vx);
B2_14= -((2*C_alpha_f*(lf^2))-(2*C_alpha_r*(lr^2))/(Iz*Vx));
A22= (-((2*C_alpha_f)+(2*C_alpha_r)))/(m*Vx);
A23= ((2*C_alpha_f)+(2*C_alpha_r))/m ;
A24= ((-2*C_alpha_f*lf)+(2*C_alpha_r*lr))/(m*Vx) ;
A42= (-((2*C_alpha_f*lf)-(2*C_alpha_r*lr)))/(Iz*Vx) ;
A43= ((2*C_alpha_f*lf)-(2*C_alpha_r*lr))/Iz ;
A44= (-((2*C_alpha_f*(lf^2))+(2*C_alpha_r*(lr^2))))/(Iz*Vx) ;
A= [0 1 0 0; 0 A22 A23 A24; 0 0 0 1; 0 A42 A43 A44;];
B1= [0; B1_12; 0; B1_14];
B2= [0; B2_12; 0; B2_14]; 
%% Feedback
P= [complex(-5,-3); complex(-5,3) ; -7; -10];
K=place(A, B1, P);
PsiDot_des= Vx/R;
%% FeedForward
mf= (m*lr)/(lf+lr); mr=(m*lf)/(lf+lr);
L= lf+lr;
ay= (Vx^2)/R;
Kv= (mf/(2*C_alpha_f))-(mr/(2*C_alpha_r)); %Understeer gradient
delta_ss= (L/R)+Kv*ay; %steady state steering angle
alpha_r= (mr*(Vx^2))/(2*C_alpha_r*R); alpha_f= (mf*(Vx^2))/(2*C_alpha_f*R);%Slipe angle at front and rear
e2_ss= alpha_r-(lr/R); %steady state yaw angle error
k3= -(K(1,3)); %steady state yaw angle error gain
delta_ff= (L/R)+((Kv*ay)-(k3*e2_ss)); % Feedforward component











