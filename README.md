# Baseband Communication BER Analysis

This project is part of ELEC365 Fundamentals of Digital Communications course. It focuses on analyzing the Bit Error Rate (BER) of a baseband communication system over an Additive White Gaussian Noise (AWGN) channel. The project involves both theoretical derivations and simulations using MATLAB.

## Project Description


$$
𝑠_1(t) = \begin{cases} 
A \cdot \sin\left(\frac{2\pi t}{T}\right), &  0 \leq t \leq \frac{T}{2} \\ 
0, & \text{else} 
\end{cases}
$$


$s_2(t) = -s_1(t - \frac{T}{2}) \$

These signals are transmitted over an AWGN channel, and the BER is analyzed for two cases:
1. $( P(1) = P(0) = \frac{1}{2} \)$
2. $\( P(1) = \frac{1}{4}, P(0) = \frac{3}{4} \)$

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
    git clone https://github.com/SuleDemirdas/Baseband_Communication_BER_Analysis.git
    ```

2. Open MATLAB and navigate to the project directory.

