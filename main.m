function []=main(N,SNRdB,Tb,Tc,Montecarlo)
    A=[-1,1];

    P_sym_th=transmission_theoretical(SNRdB);

    fprintf('\n*************\n\n\n');
    disp('MeanInterferencePe:')
    meanPeInterference=transmission_interference(N,SNRdB,Tb,Tc,Montecarlo,A);
    disp(mean(meanPeInterference));
    fprintf('\n*************\n\n\n');
    disp('MeanCompletePe:')
    meanPeComplete=transmission_complete(N,SNRdB,Tb,Tc,Montecarlo,A);
    disp(mean(meanPeComplete));
    fprintf('\n*************\n\n\n');

    plot_transmissions(SNRdB,P_sym_th,meanPeInterference,meanPeComplete);

end