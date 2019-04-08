%% PXPY
hold on
plot(PxCL_DLC60.Data(:,1), PyCL_DLC60.Data(:,1), 'blue', PxOL_DLC60.Data(:,1), PyOL_DLC60.Data(:,1), 'red');
title ('DLC trajectory at 80 Kmph');
ylabel('Py (m)'); xlabel('Px (m)');
legend('Controlled vehicle','Uncontrolled vehicle')
legend('Location','Northwest')
hold off

%% Yaw Rate
t=0:0.001:12;
hold on
plot(t,yawrateCL_DLC60.Data(:,1),'blue', t, yawrateOL_DLC60.Data(:,1), 'red');
title ('Yaw rate during DLC at 80 Kmph');
ylabel('Yaw Rate (rad/s)'); xlabel('Time (s)');
legend('Controlled vehicle','Uncontrolled vehicle')
legend('Location','Northwest')
hold off

%% Input shaper
hold on
plot(PxIS_L.Data(:,1), PyIS_L.Data(:,1), 'blue', PxIS_NL.Data(:,1), PyIS_NL.Data(:,1), 'red', PxOG.Data(:,1), PyOG.Data(:,1), 'green');
title ('DLC trajectory at 80 Kmph');
ylabel('Py (m)'); xlabel('Px (m)');
legend('L','NL','OG')
legend('Location','Northwest')
hold off

