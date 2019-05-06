%% PXPY
hold on
plot(PxOG.Data(:,1), PyOG.Data(:,1), 'blue', Px_RC.Data(:,1), Py_RC.Data(:,1), 'red', Px_RCIS.Data(:,1), Py_RCIS.Data(:,1), 'magenta');
title ('DLC trajectories at 80 Kmph');
ylabel('Py (m)'); xlabel('Px (m)');
legend('Original Input','Feedback Controller', 'Feedforward+Feedback')
legend('Location','Northwest')
hold off

%% Yaw Rate
t=0:0.001:12;
hold on
plot(t,rad2deg(delta_og.Data(:,1)),'blue', t, rad2deg(delta_IS.Data(:,1)), 'green',  t, rad2deg(delta_RC.Data(:,1)), 'red', t, rad2deg(delta_RCIS.Data(:,1)), 'magenta');
title ('The road-wheel steering angles for DLC at 80 Kmph');
ylabel('delta (deg)'); xlabel('Time (s)');
legend('Original Input','Feedforward only','Feedback controller','Feedforward+Feedback');
legend('Location','Southwest')
hold off

%% Input shaper
hold on
plot(PxIS_L.Data(:,1), PyIS_L.Data(:,1), 'blue', PxIS_NL.Data(:,1), PyIS_NL.Data(:,1), 'red', PxOG.Data(:,1), PyOG.Data(:,1), 'green');
title ('DLC trajectory at 80 Kmph');
ylabel('Py (m)'); xlabel('Px (m)');
legend('L','NL','OG')
legend('Location','Northwest')
hold off

