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
    
    Zb = Ub^2/Sb ;     %Base Grid Impedance  

  % Short circuit impedance
 
  SCR = 20;                         % Short Circuit Ratio
  Xg_pu = 1/SCR;              % AC line reactor in per-unit [p.u]
  Rg_pu = Xg_pu/10;     % AC line resistance in per-unit [p.u]
         
  Xg = Xg_pu*Zb;  % AC line reactor in SI (International System of Units) 
    
  Lg = Xg/wb;           % AC line inductance
  Rg  = Rg_pu*Zb; % AC line resistance 

% Paralell impedances (sudden variation of the SCR)

  SCR_F = 2;                         % Short Circuit Ratio
  SCR_I = 10;                         % Short Circuit Ratio 
  
  X1_pu = 1/SCR_F;              % AC line reactor in per-unit [p.u]
  R1_pu = X1_pu/10;     % AC line resistance in per-unit [p.u]

  L_1 = X1_pu*Zb/wb;  % AC line reactor in SI (International System of Units) 
  R_1  = R1_pu*Zb; % AC line resistance 

  X2_pu = X1_pu/SCR_I/(X1_pu-1/SCR_I);
  R2_pu = X2_pu/10;     % AC line resistance in per-unit [p.u]

  L_2 = X2_pu*Zb/wb;  % AC line reactor in SI (International System of Units) 
  R_2  = R2_pu*Zb; % AC line resistance 
  
  
  Xc_pu = 0.15;
  DX_DR = 5;
  I_max_VI_pu = 1.2;
  
  A_VI = (1 + 1/DX_DR^2);
  B_VI = 2*Xc_pu;
  C_VI = Xc_pu^2 - 1/I_max_VI_pu^2;
  
  Delta_VI = B_VI^2 - 4*A_VI*C_VI;
  
  X_VI = (-B_VI + sqrt(Delta_VI))/(2*A_VI);
  Kp_Rvi_pu = X_VI/(DX_DR*(-1+I_max_VI_pu))
  
  % voltage ride through
  
  V_min1 = 0.1;
  V_min2 = V_min1+0.1;
