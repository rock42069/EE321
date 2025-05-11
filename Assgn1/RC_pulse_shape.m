function [rc_pulse] = RC_pulse_shape()

% Generating the Raised Cosine Pulse

      span=6; % given 
      samppersym=12; % given 
      alpha = 0.25; % here alpha is a parameter that we can set


      % using the eqn of raised cosine 
      t = (-span*samppersym:samppersym*span) / samppersym; 
      rc_pulse = sinc(t) .* cos(pi*alpha*t) ./ (1 - (2*alpha*t).^2);

      % edge handling when denom = 0
      rc_pulse(isinf(rc_pulse)) = 0;
  
     
end

    