%%####################### Assignment 3 #########################
clc , clearvars , close all

% 1)a
p = randi([0,1],16,1);
QPSK_p = Modulate_QPSK(p);
% 1)b 
d = randi([0,1],584,1);
QPSK_d = Modulate_QPSK(d);
% 1)c
QPSK_b = [QPSK_p',QPSK_d'];

% 2)

% Given frequency offset
delta_f = 10^4; 
% Given symbol time
T = 1e-6; 
% Given normalized frequency offset
Gamma = 2*pi*delta_f*T; 
% Given phase offset
theta = 30 * (pi/180); 
% Given SNR
SNR_dB = 30;

K = length(QPSK_b);

k_indices = 1:K;
% Adding Phase Offset to the QPSK Signal
y_no_noise = QPSK_b .* exp(1j * (Gamma * k_indices + theta));
% Adding Noise
y_noisy = Noise_addn(y_no_noise, K, SNR_dB);

% Helper Function for visualisations and plots
Visualization(QPSK_b,y_noisy,y_no_noise,k_indices, K);

% 3)

SNR_dB_values = [10, 15, 20, 25, 30];
num_SNR = length(SNR_dB_values);
Gamma_est_values = zeros(1, num_SNR);
theta_est_values = zeros(1, num_SNR);
delta_f_est_values = zeros(1, num_SNR);

figure;
% For loop for looping over all the SnR values
for snr_idx = 1:num_SNR

    % Same Steps as Question 2 
    delta_f = 10^4; 
    T = 1e-6; 
    Gamma = 2*pi*delta_f*T; 
    theta = 30 * (pi/180);
    
    K = length(QPSK_b);
    
    k_indices = 1:K;
    
    y_no_noise = QPSK_b .* exp(1j * (Gamma * k_indices + theta));
    
    y_noisy = Noise_addn(y_no_noise, K, SNR_dB_values(snr_idx));
    
    pilot_indices = 1:8;
    y_pilot = y_noisy(pilot_indices);
    b_pilot = QPSK_b(pilot_indices);
    
    [delta_f_ML,gamma_ML,theta_ML] = ML_estimation(y_pilot,b_pilot, T, pilot_indices);
    
    % Store estimates
    Gamma_est_values(snr_idx) = gamma_ML;
    theta_est_values(snr_idx) = theta_ML;
    delta_f_est_values(snr_idx) = delta_f_ML;
    
    % Compensate for frequency and phase offset
    y_compensated = y_noisy .* exp(-1j * (gamma_ML * k_indices + theta_ML));
    
    subplot(2, 3, snr_idx);
    scatter(real(y_compensated), imag(y_compensated), '.');
    grid on;
    title(['Compensated Constellation (SNR = ', num2str(SNR_dB_values(snr_idx)), ' dB)']);
    xlabel('In-phase');
    ylabel('Quadrature');
    axis([-1.5 1.5 -1.5 1.5]); 
    axis equal;

    text_str = {['Δf_{est} = ', num2str(delta_f_ML/1000, '%.2f'), ' kHz'], ...
                ['Δf_{true} = ', num2str(delta_f/1000, '%.2f'), ' kHz'], ...
                ['θ_{est} = ', num2str(theta_ML*180/pi, '%.1f'), '°'], ...
                ['θ_{true} = ', num2str(theta*180/pi, '%.1f'), '°']};
    text(-1.4, -1.2, text_str, 'FontSize', 8);


    
end

% Printing the Table to the terminal 
fprintf('\n--- Frequency and Phase Offset Estimation Results ---\n');
fprintf('%-10s %-20s %-20s %-20s %-20s\n', 'SNR (dB)', 'Est. Δf (Hz)', 'True Δf (Hz)', 'Est. θ (deg)', 'True θ (deg)');
fprintf('%-10s %-20s %-20s %-20s %-20s\n', '--------', '------------', '------------', '------------', '------------');

for i = 1:num_SNR
    fprintf('%-10d %-20.2f %-20.2f %-20.2f %-20.2f\n', ...
        SNR_dB_values(i), delta_f_est_values(i), delta_f, ...
        theta_est_values(i)*180/pi, theta*180/pi);
end



figure;
subplot(2,1,1);
semilogx(SNR_dB_values, abs(delta_f_est_values - delta_f)/delta_f * 100, '-o', 'LineWidth', 1.5);
grid on;
title('Frequency Offset Estimation Error vs SNR');
xlabel('SNR (dB)');
ylabel('Relative Error (%)');

subplot(2,1,2);
semilogx(SNR_dB_values, abs(theta_est_values - theta)*180/pi, '-o', 'LineWidth', 1.5);
grid on;
title('Phase Offset Estimation Error vs SNR');
xlabel('SNR (dB)');
ylabel('Absolute Error (degrees)');


