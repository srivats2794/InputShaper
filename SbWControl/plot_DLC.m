%% PXPY
width=17; height= 0.6;
xrec1 = 125 - width/2;
xrec2 = 125 + width/2;
yrec2 = 0 + height/2;
yrec1 = 0 - height/2;
xrec11 = 38 - width/2;
xrec12 = 38 + width/2;
yrec12 = 0 + height/2;
yrec11 = 0 - height/2;
x_lane= linspace(0,350);
y1_lane= -1*ones(1,100);
y2_lane= 1*ones(1,100);
y3_lane= 3*ones(1,100);
plot(Px_UC_80(:,1),Py_UC_80(:,1),'-m',Px_RC_80(:,1),Py_RC_80(:,1),':r',Px_IS,Py_IS,'--b',x_rcis_2i(:,1),y_rcis_2i(:,1),'-.g','LineWidth',5);
axis([0 315 -3 7])
set(gca,'fontsize',24)
title ('Trajectories of DLC(80Kmph)','FontSize',28);
legend('Uncontrolled','Feedback Controller','Feedforward Controller','Feedforward+Feedback Control','FontSize',20);
ylabel('Lateral Displacement (m)','FontSize',28); xlabel('Longitudinal Displacement (m)','FontSize',28);
legend('Location','Northeast');
hold on
plot(x_lane,y1_lane,'--k',x_lane,y2_lane,'--k',x_lane,y3_lane,'--k','LineWidth',5,'HandleVisibility','off');
hold on
h=fill([xrec1,xrec2,xrec2,xrec1],[yrec1,yrec1,yrec2,yrec2],'b','HandleVisibility','off');
h.FaceAlpha=0.3;
hold on
h=fill([xrec11,xrec12,xrec12,xrec11],[yrec11,yrec11,yrec12,yrec12],'b','HandleVisibility','off');
h.FaceAlpha=0.3;
hold off

%% Yaw Rate
tsim1= 0:0.001:14.002;
tsim2= 0:0.001:14.002;
plot(tsim1,rad2deg(yawrate_UC_80),'-m',tsim1,rad2deg(yawrate_is),'--b',tsim1,rad2deg(yawrate_RC_80),':r',tsim1,rad2deg(yawrate_RCIS),'-.g','LineWidth',5);
axis([0 14 -1 0.8])
set(gca,'fontsize',24);
title ('Yaw rate profile','fontsize',28);
legend('Uncontrolled','Feedforward Controller','Feedback Controller','Feedforward+Feedback Control','FontSize',20);
ylabel('Yaw Rate(deg/s)','fontsize',28); xlabel('Time(s)','fontsize',28);

%%
t=0:0.001:14.002;
plot(t,rad2deg((1/20)*delta_UC),'-m',t,rad2deg(delta_is_new),'--b',t,rad2deg(delta_rc_new),':r',t,rad2deg(delta_rcis_new),'-.g','LineWidth',5);
axis([0 14 -1.25 1.25])
set(gca,'fontsize',24);
title ('Road-Wheel angle profiles (deg)','fontsize',28);
ylabel('Road-Wheel Steer Angle(deg)','fontsize',28); xlabel('Time(s)','fontsize',28);
legend('Uncontrolled','Feedforward Controlled','Feedback Controlled','Feedback+Feedforward Controlled','FontSize',20);
legend('Location','Southwest')

%%

t=0:0.001:14.002;
plot(t,rad2deg(DLCTest_new2),'-m',t,rad2deg(thetaSW_actual),'--b',t,rad2deg(thetaSW_actual_3i),':r',t,rad2deg(thetaSW_actual_4i),'-.g','LineWidth',5);
axis([0 14 -24 24])
set(gca,'fontsize',24);
title ('Hand-Wheel angle profiles of the robust shapers (deg)','fontsize',28);
ylabel('Hand-Wheel Steer Angle(deg)','fontsize',28); xlabel('Time(s)','fontsize',28);
legend('Uncontrolled','ZV','ZVD','ZVDD','FontSize',20);
legend('Location','Southwest')

%%

t=0:0.001:14.002;
plot(t,rad2deg(DLCTest_new2),'-m','LineWidth',5);
axis([0 14 -24 24])
set(gca,'fontsize',24);
title ('Input Hand-Wheel angle profile for DLC(deg)','fontsize',28);
ylabel('Hand-Wheel Steer Angle(deg)','fontsize',28); xlabel('Time(s)','fontsize',28);

%%

plot(Px_UC_80(:,1),Py_UC_80(:,1),'-m',zv(:,1),zv(:,2),':r',zvd(:,1),zvd(:,2),'--b',zvdd(:,1),zvdd(:,2),'-.g','LineWidth',3);
axis([0 245 -3 7.5])
set(gca,'fontsize',24)
title ('DLC trajectories for robust reference shapers (80 KmpH)','FontSize',28);
legend('Uncontrolled','Feedback Controller','Feedforward Controller','Feedforward+Feedback Control','FontSize',20);
ylabel('Lateral Displacement (m)','FontSize',28); xlabel('Longitudinal Displacement (m)','FontSize',28);
legend('Location','Northeast');

%%
tsim1= 0:0.001:14.003;
tsim2= 0:0.001:14.003;
plot(tsim1,rad2deg(yawrate_UC_80),'-m',tsim1,rad2deg(yrzv),'--b',tsim1,rad2deg(yrzvd),':r',tsim1,rad2deg(yrzvdd),'-.g','LineWidth',5);
axis([0 14 -1 0.8])
set(gca,'fontsize',24);
title ('Yaw rate profile','fontsize',28);
legend('Uncontrolled','Feedforward Controller','Feedback Controller','Feedforward+Feedback Control','FontSize',20);
ylabel('Yaw Rate(deg/s)','fontsize',28); xlabel('Time(s)','fontsize',28);

