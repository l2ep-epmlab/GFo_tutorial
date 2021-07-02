close all
figure;
t_sim = ScopeData.time;
P_sim = ScopeData.signals(1).values(:,1);
delta_sim = ScopeData.signals(5).values(:,1);
plot(delta_sim,P_sim,'g')
axis([0 4 -0.1 1.2]);
grid
delta_th = 0:1e-3:pi;
P_th = 1/(Xc_pu+Xg_pu)*sin(delta_th);
hold on 
plot(delta_th,P_th,'r');
P_th2 = 1/(Xc_pu+Xg_pu+X_VI)*sin(delta_th);
%plot(delta_th,P_th2,'g');

