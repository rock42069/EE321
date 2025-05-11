% Question 2

%Generating the QPSK symbols
function [mod_symbol] = Modulate_QPSK(bits)

    data_int = bit2int(bits,2);
    symbols = pskmod(data_int, 4, pi/4);
    mod_symbol = symbols;

  
