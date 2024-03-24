clc
clear all
close all

% polar NRZ-L
% 22-47048-1
% AB-CDEFG-H


bit_stream = [0 0 0 0 0 1 0 0 1 0 0 0]; 
no_bits = length(bit_stream); 
bit_rate = 4000; 
pulse_per_bit = 1; 
pulse_duration = 1/((pulse_per_bit)*(bit_rate)); 
no_pulses = no_bits*pulse_per_bit; 
samples_per_pulse = 500; 

fs = (samples_per_pulse)/(pulse_duration); 
t = 0: 1/fs: (no_pulses)*(pulse_duration);

no_samples = length(t);  
dig_sig = zeros(1, no_samples); 

max_voltage = 5; 
min_voltage = -5; 

for i = 1:no_bits 
    if bit_stream(i) == 0
        dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = max_voltage*ones(1,samples_per_pulse); 
    else 
        dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = min_voltage*ones(1,samples_per_pulse); 
    end 
end 

plot(t,dig_sig, 'linewidth', 1.5) 
grid on 
xlabel('time in seconds') 
ylabel('Voltage') 
ylim([(min_voltage - (max_voltage)*0.2) (max_voltage+max_voltage*0.2)]) 
title(['NRZ - L for ', num2str(bit_stream), ''])