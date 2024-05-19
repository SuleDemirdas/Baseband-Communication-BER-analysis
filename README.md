# Baseband Communication BER Analysis

This project is part of ELEC365 Fundamentals of Digital Communications course. It focuses on analyzing the Bit Error Rate (BER) of a baseband communication system over an Additive White Gaussian Noise (AWGN) channel. The project involves both theoretical derivations and simulations using MATLAB.

## Project Description

In this project, we analyze a baseband communication system where two signals, \( s_1(t) \) and \( s_2(t) \), are used to transmit bits "1" and "0" respectively. The expressions for these signals are:

\[ s_1(t) = \begin{cases} 
A \sin\left(\frac{2\pi t}{T}\right), & 0 \le t \le \frac{T}{2} \\
0, & \text{else} 
\end{cases} \]

\[ s_2(t) = -s_1(t - \frac{T}{2}) \]

The project includes:
- Analytical derivation of the BER expression for different bit probabilities.
- MATLAB simulation to obtain the BER curve versus SNR.
- Comparison between theoretical and simulated BER curves.

## Files in the Repository

- `ber_analysis.m`: MATLAB script containing the main function `ber_curve` which performs the BER analysis and plotting.
- `README.md`: This file providing an overview and instructions for the project.

## MATLAB Code

The core of the project is implemented in `ber_analysis.m`. The function `ber_curve(P0, P1)` calculates and plots the theoretical and simulated BER for the given bit probabilities \( P(0) \) and \( P(1) \).

### Usage

1. Clone the repository to your local machine:
    ```sh
    git clone https://github.com/your_username/Baseband_Communication_BER_Analysis.git
    ```

2. Open MATLAB and navigate to the project directory.

