%%####################### Assignment 2 #########################
clc , clearvars , close all


% 1
bits_seq = randi([0,1],600,1);

% 2
qpsk_symbols = Modulate_QPSK(bits_seq);

% 2.a) creating RC filter 
rc_filter = RC_pulse_shape();

% 2.b, 2.c) 
qpsk_shaped = transmit_pulse(qpsk_symbols, rc_filter);


snr_values = [6, 8, 10]; % SNR levels to simulate

figure;
for i = 1:length(snr_values)
    % 2.d),2.e)
 
    qpsk_noisy = Noise_addn(qpsk_shaped, snr_values(i));
    qpsk_noisy_shaped = receive_matched(qpsk_noisy, rc_filter);
    
    % 2.f)
    %visualize_start_point(qpsk_noisy_shaped)
    
    % Based on the visualization, as guided in the assignment,  
    % the best sampling point was determined to be at index 1.  
    % This decision was made by analyzing the constellation diagram,  
    % which showed four well-separated clusters with minimal noise spread.  
    % Since the signal exhibits clear symbol distinction at this sampling point,  
    % we select the first sample of each symbol during downsampling  
    % to ensure optimal demodulation.  
    best_sample_start = 1;
    qpsk_downsampled = qpsk_noisy(best_sample_start:12:end);

    % 2.g)
    subplot(1, 3, i);
    plot(real(qpsk_downsampled), imag(qpsk_downsampled), 'b.');
    title(['Received Constellation at SNR = ', num2str(snr_values(i)), ' dB']);
    xlabel('In-phase');
    ylabel('Quadrature');
    axis equal;
    grid on;
end
