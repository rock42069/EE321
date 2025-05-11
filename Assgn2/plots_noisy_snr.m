function plots_noisy_snr(i, )
    
    subplot(1, 3, i);
    plot(real(qpsk_noisy), imag(qpsk_noisy), 'b.');
    title(['Received Constellation at SNR = ', num2str(snr_values(i)), ' dB']);
    xlabel('In-phase');
    ylabel('Quadrature');
    axis equal;
    grid on;