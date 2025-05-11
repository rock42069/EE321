function visualize_start_point(qpsk_noisy)

% helper function just to find the best sampling rate
    SNR_dB = 10;
    subplot(3,1,2);
    plot(real(qpsk_noisy)); hold on;
    plot(imag(qpsk_noisy)); hold off;
    legend('Real', 'Imaginary');
    title(['Noisy QPSK Signal (SNR = ', num2str(SNR_dB), ' dB)']);
    
    best_sample_start = 1;
   
    qpsk_downsampled = qpsk_noisy(best_sample_start:12:end);

    figure;
    scatter(real(qpsk_downsampled), imag(qpsk_downsampled), 'b.');
    title('Constellation Diagram After Downsampling');
    xlabel('In-phase');
    ylabel('Quadrature');
    grid on;