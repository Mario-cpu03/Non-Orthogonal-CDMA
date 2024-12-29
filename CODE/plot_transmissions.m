function [] = plot_transmissions(SNRdB, P_sym_th, meanPeInterference, meanPeComplete)
    
    color_th = 'k';   
    color_interf = 'b'; 
    color_complete = 'g';

    symbol_th = 'o';  
    symbol_interf = 'd'; 
    symbol_complete = '^'; 

    % Graph theoretical
    figure;
    semilogy(SNRdB, P_sym_th, [color_th, '--', symbol_th], 'MarkerSize', 6, 'Linewidth', 2); hold on;
    xlabel('SNRdB', 'FontSize', 15);
    ylabel('Pe', 'FontSize', 15);
    title('Graph theoretical', 'FontSize', 15);
    legend('Theoretical', 'FontSize', 18, 'Location', 'southwest');
    grid on;

    % Graph theoretical-interference
    figure;
    semilogy(SNRdB, P_sym_th, [color_th, '--', symbol_th], 'MarkerSize', 6, 'Linewidth', 2); hold on;
    semilogy(SNRdB, meanPeInterference, [color_interf, '-.', symbol_interf], 'MarkerSize', 6, 'Linewidth', 2);
    xlabel('SNRdB', 'FontSize', 15);
    ylabel('Pe', 'FontSize', 15);
    title('Graph theoretical-interference', 'FontSize', 15);
    legend('Theoretical', 'Interference-only', 'FontSize', 18, 'Location', 'southwest');
    grid on;

    % Graph theoretical-interference-reality
    figure;
    semilogy(SNRdB, P_sym_th, [color_th, '--', symbol_th], 'MarkerSize', 6, 'Linewidth', 2); hold on;
    semilogy(SNRdB, meanPeInterference, [color_interf, '-.', symbol_interf], 'MarkerSize', 6, 'Linewidth', 2);
    semilogy(SNRdB, meanPeComplete, [color_complete, ':', symbol_complete], 'MarkerSize', 6, 'Linewidth', 2);
    xlabel('SNRdB', 'FontSize', 15);
    ylabel('Pe', 'FontSize', 15);
    title('Graph theoretical-interference-reality', 'FontSize', 15);
    legend('Theoretical', 'Interference-only', 'Interference and Noise', 'FontSize', 18, 'Location', 'southwest');
    grid on;

    
end