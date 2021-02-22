function complimentary_filters()
    %Domen Kuhar
    
    [rec,Fs] = audioread('3.yesterday_sinus.wav');
    t = (0:length(rec)-1)/Fs;
    
    %lowpass filter
    Wnl=290/(Fs/2);
    l101=fir1(101,Wnl,'low');
    l201=fir1(201,Wnl,'low');
    l301=fir1(301,Wnl,'low');
    fl101=filter(l101,1,rec);
    fl201=filter(l201,1,rec);
    fl301=filter(l301,1,rec);
    audiowrite('lowpass101.wav',fl101,Fs);
    audiowrite('lowpass201.wav',fl201,Fs);
    audiowrite('lowpass301.wav',fl301,Fs);
    
    %highpass filter
    Wnh=380/(Fs/2);
    h101=fir1(101,Wnh,'high');
    h201=fir1(201,Wnh,'high');
    h301=fir1(301,Wnh,'high');
    fh101=filter(h101,1,rec);
    fh201=filter(h201,1,rec);
    fh301=filter(h301,1,rec);
    audiowrite('highpass101.wav',fh101,Fs);
    audiowrite('highpass201.wav',fh201,Fs);
    audiowrite('highpass301.wav',fh301,Fs);
    
    %rezultati - primerjava grafov
    figure('Name','Lowpass - Highpass comparison','NumberTitle','off');
    zoom on;
    subplot(4,1,1);
    plot(t,rec);
    title('Original signal');
    xlabel('Time (s)');
    grid on;

    subplot(4,2,3);
    plot(t,fl301);
    title('After Lowpass filter with length 301');
    xlabel('Time (s)');
    grid on;

    subplot(4,2,4);
    plot(t,fh301);
    title('After Highpass filter with length 301');
    xlabel('Time (s)');
    grid on;
    
    subplot(4,2,5);
    plot(t,fl201);
    title('After Lowpass filter with length 201');
    xlabel('Time (s)');
    grid on;
    
    subplot(4,2,6);
    plot(t,fh201);
    title('After Highpass filter with length 201');
    xlabel('Time (s)');
    grid on;
    
    subplot(4,2,7);
    plot(t,fl101);
    title('After Lowpass filter with length 101');
    xlabel('Time (s)');
    grid on;
    
    subplot(4,2,8);
    plot(t,fh101);
    title('After Highpass filter with length 101');
    xlabel('Time (s)');
    grid on;
    
    %rezultati - amplitudni spectrum
    figure('Name','Amplitude spectrum - comparison','NumberTitle','off');
    subplot(3,2,1);
    psdest = psd(spectrum.periodogram,fl101,'Fs',Fs);
    plot(psdest.Frequencies,psdest.Data);
    title('Amplitude spectrum of Lowpass signal at lenght 101');
    xlabel('Hz');ylabel('Amplitude');
    grid on;
    subplot(3,2,2);
    psdest = psd(spectrum.periodogram,fh101,'Fs',Fs);
    plot(psdest.Frequencies,psdest.Data);
    title('Amplitude spectrum of Highpass signal at lenght 101');
    xlabel('Hz');ylabel('Amplitude');
    grid on;
    subplot(3,2,3);
    psdest = psd(spectrum.periodogram,fl201,'Fs',Fs);
    plot(psdest.Frequencies,psdest.Data);
    title('Amplitude spectrum of Lowpass signal at lenght 201');
    xlabel('Hz');ylabel('Amplitude');
    grid on;
    subplot(3,2,4);
    psdest = psd(spectrum.periodogram,fh201,'Fs',Fs);
    plot(psdest.Frequencies,psdest.Data);
    title('Amplitude spectrum of Highpass signal at lenght 201');
    xlabel('Hz');ylabel('Amplitude');
    grid on;
    subplot(3,2,5);
    psdest = psd(spectrum.periodogram,fl301,'Fs',Fs);
    plot(psdest.Frequencies,psdest.Data);
    title('Amplitude spectrum of Lowpass signal at lenght 301');
    xlabel('Hz');ylabel('Amplitude');
    grid on;
    subplot(3,2,6);
    psdest = psd(spectrum.periodogram,fh301,'Fs',Fs);
    plot(psdest.Frequencies,psdest.Data);
    title('Amplitude spectrum of Highpass signal at lenght 301');
    xlabel('Hz');ylabel('Amplitude');
    grid on;