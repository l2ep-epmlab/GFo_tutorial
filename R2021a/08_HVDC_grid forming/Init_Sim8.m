% Grid Forming VSC with droop control strategies 

clear all

Time_Step=50e-6; % Simulation time step (s) 

fb = 50; % Nominal Frequency (Hz)
Ug = 400e3; % Nominal Grid Voltage (V)

%% Grid Parameters
    wb = 2*pi*fb;
% Nominal values  
  
    Un = Ug;                % Phase-to-Phase nominal AC grid Voltage [V]
    
    Ub =  Un;                % Base Phase-to-Phase Voltage value [V]  
    Vb =  Un/sqrt(3);        % Base simple Volatge value [V]    
    Sb =  1e9;                     % Base Apparent power [VA]
    Pb = Sb;
    
    Zb = Ub^2/Sb ;     %Base Grid Impedance  

  % Short circuit impedance
 
  SCR = 20;                         % Short Circuit Ratio
  Xg_pu = 1/SCR;              % AC line reactor in per-unit [p.u]
  Rg_pu = Xg_pu/10;     % AC line resistance in per-unit [p.u]
         
  Xg = Xg_pu*Zb;  % AC line reactor in SI (International System of Units) 
    
  Lg = Xg/wb;           % AC line inductance
  Rg  = Rg_pu*Zb; % AC line resistance 

  
  % Capacitor Parameters
  
Udc_n = 640e3;

P_dcb = Pb;

H_dc = 40e-3;
C_dc = 2*P_dcb*H_dc/Udc_n^2;

Rb = Udc_n^2/P_dcb;

R_ldc = 0.01*Rb;



