% create a matlab function that accepts frequency, user velocity and angle
% as function inputs and produces Doppler spread and coherence time as
% function output.
% By considering power-delay profile fiven in table, Write a Matlab funtion
% to calculate delay spread of the communication system.
function [doppler_spread, coherence_time] = calc_dspread()
f = input('User frequency: ');
v = input('User velocity: ');
angle = input('Angle in degree: ');
c = physconst('LightSpeed');
doppler_spread = (2*v*cosd(angle)*f)/c;
coherence_time = 0.432 / doppler_spread;
end