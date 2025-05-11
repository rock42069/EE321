function qpsk_noisy = Noise_addn(qpsk_shaped, SNR_dB)

     % Compute signal power
    signal_power = mean(abs(qpsk_shaped).^2);

    % Desired SNR in dB
    SNR_linear = 10^(SNR_dB/10); 
    % Desired Power
    noise_power = signal_power/SNR_linear;

    % Generate complex AWGN with unit variance per component
    noise = sqrt(noise_power/2) * (randn(size(qpsk_shaped)) + 1i * randn(size(qpsk_shaped)));

    % make the signal noisy
    qpsk_noisy = qpsk_shaped + noise;




    