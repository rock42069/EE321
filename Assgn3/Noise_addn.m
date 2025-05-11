function y_noisy = Noise_addn(y_no_noise,K, SNR_dB)
 
    SNR_linear = 10^(SNR_dB/10); % Convert to linear scale
    
    % Calculate signal power
    signal_power = mean(abs(y_no_noise).^2);
    
    % Calculate required noise variance per dimension for desired SNR
    noise_variance_per_dim = signal_power / (2 * SNR_linear);
    noise_std = sqrt(noise_variance_per_dim);
    
    % Generate complex AWGN with the calculated variance
    N = noise_std * (randn(1, K) + 1j * randn(1, K));
    
    % Add noise to create received signal y[k]
    y_noisy = y_no_noise + N;




    