function qpsk_shaped = transmit_pulse(qpsk_symbol, rc_filter)

    % upsampling the data
    qpsk_up = upfirdn(qpsk_symbol, 1, 12);

     % convolution with the desired pulse
    qpsk_shaped = conv(qpsk_up, rc_filter, 'same');



