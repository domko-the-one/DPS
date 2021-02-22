function eliminate()
    %Domen Kuhar
    [rec, Fs]=audioread('1.danes_je_lep_dan_klarinet_22050.wav');
    bnd = rec;
    bnd=bandstop(bnd,[49 51],Fs);
    bnd=bandstop(bnd,[121 127],Fs);
    bnd=bandstop(bnd,[244 247],Fs);
    bnd=bandstop(bnd,[435 445],Fs);
    bnd=bandstop(bnd,[1310 1330],Fs);
    bnd=bandstop(bnd,[2190 2210],Fs);
    bnd=bandstop(bnd,[3070 3090],Fs);
    bnd=bandstop(bnd,[3950 3970],Fs);
    bnd=bandstop(bnd,[4830 4850],Fs);
    bnd=bandstop(bnd,[5710 5730],Fs);
    
    audiowrite('lep_dan_filter.wav',bnd,Fs);
    
    figure('Name','Comparison of signals ans Amplitude spectrums','NumberTitle','off');
    subplot(2,2,1);
    plot(rec);
    title('Starting signal');
    
    subplot(2,2,2);
    plot(bnd);
    title('Bandstopped signal');
    
    subplot(2,2,3);
    psdest = psd(spectrum.periodogram,rec,'Fs',Fs);
    plot(psdest.Frequencies,psdest.Data);
    title('Starting amplitude spectrum');
    xlabel('Hz');ylabel('Amplitude');
    grid on;
    
    subplot(2,2,4);
    psdest = psd(spectrum.periodogram,bnd,'Fs',Fs);
    plot(psdest.Frequencies,psdest.Data);
    title('Bandstopped amplitude spectrum');
    xlabel('Hz');ylabel('Amplitude');
    grid on;