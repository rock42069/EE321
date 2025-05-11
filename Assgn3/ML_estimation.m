function [delta_f, gamma, theta] = ML_estimation(y_pilot, b_pilot, T, pilot_indices)
 
    N_dft = 1024; % DFT size for fine resolution

    % Compute y[k] * b*[k]
    yb_seq = y_pilot .* conj(b_pilot);

    % Zero-pad to N_dft points
    yb_padded = [yb_seq, zeros(1, N_dft - length(yb_seq))];

    % Perform DFT
    Z = fft(yb_padded);

    % Find frequency bin with max magnitude
    [~, n_max] = max(abs(Z));

    % Estimate Gamma
    gamma = mod(2 * pi * (n_max - 1) / N_dft, 2 * pi);

    % Estimate theta 
    Z_gamma = sum(y_pilot .* conj(b_pilot) .* exp(-1j * gamma * pilot_indices));
    theta = angle(Z_gamma);

    % Convert Gamma to frequency offset delta_f 
    delta_f = gamma / (2 * pi * T);
end
