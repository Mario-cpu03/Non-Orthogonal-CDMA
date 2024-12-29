function meanPe=transmission_complete(N,SNRdB,Tb,Tc,Montecarlo,A)
    Lc = Tb / Tc;
    meanPe = zeros(1, length(SNRdB));
    
    for ii = 1:length(SNRdB)
        numErrori = 0;
        N0 = 1 / (10 ^ (-SNRdB(ii) / 10));
        noiseVariance = N0 / 2;

        for jj=1:Montecarlo
            signalTx=2 * randi([0, 1]) - 1;
            interference_variance=Lc*(N-1) * (10 ^ (-SNRdB(ii) / 10));
            code=2*randi([0,1],1,Lc)-1;

            interference= sqrt(interference_variance)*randn(1,Lc);
            noise=sqrt(noiseVariance)*randn(1,Lc);
            signalRx=(signalTx+(code'*interference))+noise;
            
            min_diff=Inf;
            for kk=1:2
                curr_diff=norm(signalRx-A(kk));
            
                if curr_diff<min_diff
                    min_diff=curr_diff;
                    signalsceltoRx=A(kk);
                end
            end

            if ~isequal(signalsceltoRx, signalTx)
            numErrori=numErrori+1;
            end

        end
        meanPe(ii)=numErrori/Montecarlo;
    end
end