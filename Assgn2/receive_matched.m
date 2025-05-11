function qpsk_noisy_shaped = receive_matched(qpsk_noisy, rc_filter)
    
    % Receive Matched Filtering: Convolution with the same SRRC filter
    qpsk_noisy_shaped = conv(qpsk_noisy, rc_filter, 'same');