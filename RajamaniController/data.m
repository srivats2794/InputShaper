 clc; clear;                                                                                                                                                                                                                                                                               

%% System
B1_12= (2*C_alpha_f)/m;
B1_14= (2*C_alpha_f*l_f)/Iz;
B2_12= (-((2*C_alpha_f*l_f)+(2*C_alpha_r*l_r)/(m*Vx0))-Vx0);
B2_14= -((2*C_alpha_f*(l_f^2))-(2*C_alpha_r*(l_r^2))/(Iz*Vx0));
A22= (-((2*C_alpha_f)+(2*C_alpha_r)))/(m*Vx0);
A23= ((2*C_alpha_f)+(2*C_alpha_r))/m ;
A24= ((-2*C_alpha_f*l_f)+(2*C_alpha_r*l_r))/(m*Vx0) ;
A42= (-((2*C_alpha_f*l_f)-(2*C_alpha_r*l_r)))/(Iz*Vx0) ;
A43= ((2*C_alpha_f*l_f)-(2*C_alpha_r*l_r))/Iz ;
A44= (-((2*C_alpha_f*(l_f^2))+(2*C_alpha_r*(l_r^2))))/(Iz*Vx0) ;
A= [0 1 0 0; 0 A22 A23 A24; 0 0 0 1; 0 A42 A43 A44;];
B1= [0; B1_12; 0; B1_14];
B2= [0; B2_12; 0; B2_14]; 
%% Feedback
P= [complex(-5,-3); complex(-5,3) ; -7; -10];
K=place(A, B1, P);
PsiDot_des= Vx0/R;
%% FeedForward
mf= (m*l_r)/(l_f+l_r); mr=(m*l_f)/(l_f+l_r);
L= l_f+l_r;
ay= (Vx0^2)/R;
Kv= (mf/(2*C_alpha_f))-(mr/(2*C_alpha_r)); %Understeer gradient
delta_ss= (L/R)+Kv*ay; %steady state steering angle
alpha_r= (mr*(Vx0^2))/(2*C_alpha_r*R); alpha_f= (mf*(Vx0^2))/(2*C_alpha_f*R);%Slipe angle at front and rear
e2_ss= alpha_r-(l_r/R); %steady state yaw angle error
k3= -(K(1,3)); %steady state yaw angle error gain
delta_ff= (L/R)+((Kv*ay)-(k3*e2_ss)); % Feedforward component











