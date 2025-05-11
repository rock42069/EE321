function Visualization(QPSK_b,y_noisy,y_no_noise,k_indices, K)
    
    figure;
    subplot(2,2,1);
    scatter(real(QPSK_b), imag(QPSK_b), 'b.');
    grid on;
    title('Original QPSK Constellation');
    xlabel('In-phase');
    ylabel('Quadrature');
    axis equal;
    
    % Plot constellation with frequency and phase offset (no noise)
    subplot(2,2,2);
    scatter(real(y_no_noise), imag(y_no_noise), 'r.');
    grid on;
    title('Constellation with Frequency & Phase Offset (No Noise)');
    xlabel('In-phase');
    ylabel('Quadrature');
    axis equal;
    
    % Plot constellation with offset and noise
    subplot(2,2,3);
    scatter(real(y_noisy), imag(y_noisy), 'g.');
    grid on;
    title('Constellation with Offset & Noise (SNR = 30 dB)');
    xlabel('In-phase');
    ylabel('Quadrature');
    axis equal;
    
    % Plot real and imaginary parts of the received signal over time
    subplot(2,2,4);
    plot(1:50, real(y_noisy(1:50)), 'b-', 1:50, imag(y_noisy(1:50)), 'r-');
    grid on;
    title('Received Signal (First 50 Symbols)');
    xlabel('Symbol Index k');
    ylabel('Amplitude');
    legend('Real', 'Imaginary');
    
    % Plot phase evolution to visualize frequency offset
    figure;
    phase_evolution = unwrap(angle(y_no_noise));
    plot(k_indices, phase_evolution, 'b-');
    grid on;
    title('Phase Evolution Due to Frequency Offset');
    xlabel('Symbol Index k');
    ylabel('Phase (radians)');
end