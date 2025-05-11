%%% Assigment 4 %%% 


function decoded_bits = viterbi_decoder()
    % Given Sequence of y
    y = [-1, 2, -2, 1.5, 2, 1, -2, 0.5, -1, 2];
    
    % Known bits 
    % b[0] = +1
    % b[9] = +1
    b_known = [1, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, 1];
    
    % States: {+1, -1}, since BPSK
    states = [1, -1];
    num_states = length(states);
    N = length(y); 
    
    % Path metrics and traceback
    metrics = -inf(num_states, N);  
    metrics(1, 1) = 0; % Start at b[0] = +1
    metrics(2, 1) = -inf; % State b[0] = -1 is invalid
    
    % Store previous state index
    prev_state = zeros(num_states, N);
    
    % Forward pass from n=2 to n=10 for the trellis pattern
    for n = 2:N
        for curr_idx = 1:num_states % b[n]
            curr_b = states(curr_idx);
            
            % If this bit is known enforce it
            if ~isnan(b_known(n)) && curr_b ~= b_known(n)
                continue;
            end
            
            for prev_idx = 1:num_states % b[n-1]
                prev_b = states(prev_idx);
                
                % Skip if previous metric invalid
                if metrics(prev_idx, n-1) == -inf
                    continue;
                end
                
                % Given Trellis Formula: b[n] * (y[n-1] + 0.5 * b[n-1])
                branch_metric = curr_b * (y(n) + 0.5 * prev_b);
                path_metric = metrics(prev_idx, n-1) + branch_metric;
                
                % Update if better path
                if path_metric > metrics(curr_idx, n)
                    metrics(curr_idx, n) = path_metric;
                    prev_state(curr_idx, n) = prev_idx;
                end
            end
        end
    end
    
    % Traceback from final known state b[9] = +1, index 1
    decoded_bits = zeros(1, N-2); % b[1] to b[8]
    state_seq = zeros(1, N); % Holds state indices (1 or 2)
    
    % Find best final state (should be 1 since b[9] = +1, but verify)
    [~, best_final_state] = max(metrics(:, N));
    state_seq(N) = best_final_state;
    
    for n = N:-1:2
        curr_idx = state_seq(n);
        prev_idx = prev_state(curr_idx, n);
        state_seq(n-1) = prev_idx;
    end
     
    % For bits b[1] to b[8], we use the state values directly
    for i = 2:N-1
        decoded_bits(i-1) = states(state_seq(i));
    end
    
    % Output
    disp('Decoded bit sequence (b[1] to b[8]):');
    disp(decoded_bits);
end