%% PXPY
hold on
plot(PxIS_NL.Data(:,1), PyIS_NL.Data(:,1), 'blue', PxOG.Data(:,1), PyOG.Data(:,1), 'red');
title ('DLC trajectory at 80 Kmph');
ylabel('Py (m)'); xlabel('Px (m)');
legend('Input Shaped','Original Input')
legend('Location','Northwest')
hold off

%% Yaw Rate
t=0:0.001:12;
hold on
plot(t,yawrateIS_NL.Data(:,1),'blue', t, yawrateOG.Data(:,1), 'red');
title ('Yaw rate during DLC at 80 Kmph');
ylabel('Yaw Rate (rad/s)'); xlabel('Time (s)');
legend('Input Shaped','Original Input')
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

