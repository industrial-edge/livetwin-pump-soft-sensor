clear all
close all
clc

%pump configuration
pump_delivery_vector_pressure_differential = [0, 333, 666, 1000, 1333,...
    1666, 2000, 2333];
pump_pressure_differential_vector = [8.1, 8.05, 7.9, 7.5, 7, 6.3, 5.5,...
    4.5];
pump_delivery_vector_brake_power = [0, 333, 666, 1000, 1333, 1666, 2000,...
    2333];
pump_brake_power_vector = [8, 12.5, 16, 19, 21, 24.5, 25, 25.5];
Pump_design_delivery = 133;
Reference_angular_velocity = 2900;
Angular_speed_treshold_for_flow_reversal = 1e-9;
Reference_density = 1000;

%pipe configuration suction side
suction_pipe_internal_diameter = 0.1;
suction_pipe_length = 5;
suction_pipe_inlet_heigth = 0;
suction_pipe_outlet_heigth = 0;

%pipe configuration pressure side
pressure_pipe_internal_diameter = 0.1;
pressure_pipe_length = 5;
pressure_pipe_inlet_heigth = 0;
pressure_pipe_outlet_heigth = 0;

%get variables from Simulink model
simulation = sim('Pump_simulation','SimulationMode','normal');
flowrate = simulation.get('flowrate');
pumppressure = simulation.get('pumppressure');
%define time vector for simulation
time = 0 : 0.001 : 100;

%plot configurations
plot(time,flowrate)
grid minor;
title('Förderstromkennlinie Prototyp')
xlabel('t in {\it s}')
ylabel('Q in $\frac{m^3}{h}$','Interpreter','latex')

figure
plot(time,pumppressure)
grid minor
title('Pumpendruckkennlinie Prototyp')
xlabel('t in {\it s}')
ylabel('p in {\it Pa}')

figure
plot(flowrate, pumppressure)
grid minor
title('Pumpendruckkennlinie Prototyp')
xlabel('Q in $\frac{m^3}{h}$','Interpreter','latex')
ylabel('p in {\it Pa}')





