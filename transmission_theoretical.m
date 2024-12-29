function Pe=transmission_theoretical(SNRdB)
    SNR = 10.^(SNRdB / 10); % dB -> linear
    %%first section : PAM theoretical curve
    M=2; k=log2(M);
    Pe=2*(M-1)/M* qfunc(sqrt( 6*k/(M^2-1) *SNR ));
end