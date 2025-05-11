% Q4

function [] = pulse_shape_qpsk(symbols, rc_filter)

    % upsampling the data
    qpsk_up = upfirdn(symbols, 1, 12);
    % convolution with the desired pulse
    qpsk_shaped = conv(qpsk_up, rc_filter, 'same');

    in_phase = real(qpsk_shaped);
    quadrature = imag(qpsk_shaped);
    
    % Plot the pulse-shaped signal
    figure;
    set(gcf, 'Position', [100, 100, 800, 900]);

    subplot(3, 1, 1);
    plot(in_phase, 'b', 'LineWidth', 1.2);
    title('In-Phase Component', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Time Samples', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Amplitude', 'FontSize', 12, 'FontWeight', 'bold');
    grid on;
    set(gca, 'FontSize', 12, 'GridAlpha', 0.5, 'LineWidth', 1.2);

    subplot(3, 1, 2);
    plot(quadrature, 'r', 'LineWidth', 1.2);
    title('Quadrature Component', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Time Samples', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Amplitude', 'FontSize', 12, 'FontWeight', 'bold');
    grid on;
    set(gca, 'FontSize', 12, 'GridAlpha', 0.5, 'LineWidth', 1.2);
 
    subplot(3,1,3)
    plot(in_phase, quadrature, 'b.', 'MarkerSize', 5);
    hold on;
    axis equal;
    grid on;
    plot(real(symbols), imag(symbols), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    title('QPSK Modulation (Argand Plane)', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('In-Phase', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Quadrature', 'FontSize', 12, 'FontWeight', 'bold');
    set(gca, 'FontSize', 12, 'LineWidth', 1.2);

end

