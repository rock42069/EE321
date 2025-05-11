# Communication Systems (EE321) Assignments

This repository contains MATLAB implementations of assignments of course EE321    .

## Structure

```
.
├── Assgn1/                 # Basic Digital Modulation
│   ├── main.m             # Main script for modulation and pulse shaping
│   ├── Modulate_*.m       # QPSK, 8PSK, 16QAM modulators
│   ├── pulse_shape_*.m    # Pulse shaping implementations
│   └── RC_pulse_shape.m   # Raised Cosine pulse filter
│
├── Assgn2/                # Noisy Channel & Matched Filtering
│   ├── main.m             # Channel simulation with noise
│   ├── Noise_addn.m       # AWGN noise addition
│   ├── receive_matched.m  # Matched filter implementation
│   └── transmit_pulse.m   # Transmit pulse shaping
│
├── Assgn3/                # Phase & Frequency Offset Estimation
│   ├── main.m             # Frequency offset estimation
│   ├── ML_estimation.m    # Maximum Likelihood estimator
│   └── Visualization.m    # Constellation visualization
│
└── Assgn4/                # Viterbi Decoding
    └── viterbi_decoder.m  # Viterbi algorithm implementation
```

## Features

### Assignment 1: Digital Modulation
- Implementation of QPSK, 8-PSK and 16-QAM modulators
- Raised Cosine pulse shaping
- Constellation visualization

### Assignment 2: Channel Effects
- AWGN noise simulation
- Matched filtering
- Signal downsampling and constellation recovery

### Assignment 3: Synchronization
- Frequency offset estimation
- Phase offset estimation
- ML-based parameter estimation
- Performance analysis across different SNR values

### Assignment 4: Channel Coding
- Viterbi decoder implementation
- Trellis-based sequence detection
- Branch metric computation
- Path traceback algorithm

## Usage

Each assignment folder contains a `main.m` script that can be run to execute the respective implementations. For example:

```matlab
% Run Assignment 1
cd Assgn1
main
```

## Dependencies

- MATLAB
- Communications Toolbox (for modulation functions)
- Signal Processing Toolbox (for filtering operations)
