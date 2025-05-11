%% ########### ASSIGNMENT 1 ##############
clc , clearvars, close all

% Q1
bits_seq = randi([0,1],600,1);

% Q2 & Q3

% the function returns the sequence and generates the plots as well
qpsk_symbols = Modulate_QPSK(bits_seq);
psk8_symbols = Modulate_8PSK(bits_seq);
qam16_symbols = Modulate_16QAM(bits_seq);

% Q4

% creating RC filter 
rc_filter = RC_pulse_shape();

% convolution of signal 
pulse_shape_qpsk(qpsk_symbols,rc_filter);
pulse_shape_psk8(psk8_symbols,rc_filter);
pulse_shape_qam16(qam16_symbols,rc_filter);

