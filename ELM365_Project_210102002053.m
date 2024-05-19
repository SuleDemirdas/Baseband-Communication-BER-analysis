close all;
clear all;

function ber_curve(P0,P1)
    % Parameters
    % we decide Eb to be 1 for both case. 
    % Eb = A^2*T/4 to be 1, we choose T = 1 and A = 2.
    
    T = 1; % Bit duration
    A = 2; % Amplitude of the signals
    
    SNR_dB = 0:1:15; % Range of SNR values in dB 10log(10) (Eb/N0)
    
    numBits = 10*10^6; % Number of bits to simulate
    
    % Calculated Parameters:
    
    Es1 =  A^2*T/4;
    Es2 =  A^2*T/4;

    a1 =  A^2*T/4;
    a2 =  -A^2*T/4;

    gamma0 = (a1+a2)/2;

    Eh = A^2*T/2;

    BER_theoretical = zeros(size(SNR_dB));
    BER_simulated = zeros(size(SNR_dB));


    Eb = P1*Es1+P0*Es2;

    for i = 1:length(SNR_dB)
    
        % First we generate random databits for every SNR value
        data = randi([0, 1], 1, numBits);
        
        % SNR_dB = 10*log(10) (1/N0), (1/N0 because we choose Eb = 1)
        N0 = 1/(10^(SNR_dB(i)/10)); 
        
        sigma0Square = N0*Eh/2;
       
        % Generating AWGN Channel Noise:
    
        % randn generates normally distributed random numbers with variance of 1
        % but we want normally distributed values with different variance
        % value.
        % To have sdifferent variance value we multiply it with square root of
        % desired varience. 
        noise = sqrt(sigma0Square) .* randn(1, numBits);
        
        % This line of code makes z = a1+n0 when given data bir is 1 and
        % z = a2+n0 when given data is 0.
        z = (a1 + noise) .* data + (a2 + noise) .* (1 - data);
        
        % This line of code is used for deciding s to be 1 or 0.
        % When z is bigger than gamma0 detected_data_a is 1 when it's 0
        % detected_data_a is 0.
        detected_data_a = (z>gamma0);
    
        % Calculating Number of Bit Errors
        numErrors = sum(detected_data_a ~= data);
    
        % Calculate BER (bit error rate)
        % This line of code calculates Pb for every single SNR value.
        BER_simulated(i) = numErrors / numBits; 
    
        % Calculate theoretical BER
        q = qfunc(sqrt(Eb/N0)); % Q-function
        BER_theoretical(i) = q;

    end
    
    figure;
    semilogy(SNR_dB, BER_theoretical,"r", SNR_dB, BER_simulated,"b--");
    grid on;
    xlabel('SNR (dB)');
    ylabel('Bit Error Rate (BER)');
    legend('Theoretical', 'Simulated');
    title('Bit Error Rate (BER) vs. Signal-to-Noise Ratio (SNR)');

end

% For the option (a) (P(1) = P(0) = 1/2):
ber_curve(1/2,1/2)

% For the option (b) (P(1) = 1/4 and P(0) = 3/4):
ber_curve(1/4,3/4)
