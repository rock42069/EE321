
% Q2 
function [mod_symbols] = Modulate_8PSK(bits)

    % modulation scheme
    data_int = bit2int(bits,3);
    symbols = pskmod(data_int,8,pi/4);
    mod_symbols = symbols;
    % creating a beautified plot
   
    scatterplot(symbols, 1, 0, 'b*'); 
    title('8PSK Constellation', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('In-phase', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Quadrature', 'FontSize', 12, 'FontWeight', 'bold');
    grid on;
    axis equal; 
    xlim([-1.5, 1.5]); 
    ylim([-1.5, 1.5]);
    hold on;
    plot(real(symbols), imag(symbols), 'ro', 'MarkerSize', 8, 'LineWidth', 1.5); 
    hold off;

end