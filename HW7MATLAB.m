
%Yuval Epstain Ofek - MATLAB HW 7
clear
close all
clc
%%
%%%1. Generate a signal that consists of a sum of sine waves of frequencies 1 to 50 kHz. Set t to be
%%% from 0 to 2 seconds, using an interval of 10µs.
t = 0:10^(-5):0.001;
f = (1:50)*1000;
signal = sum(sin(2*pi*f'.*t), 1);

%%
%%%2. Create a Butterworth lowpass filter with a sampling frequency of Fs = 100 kHz, a passband
%%%frequency of Fpass = 10 kHz, a stopband frequency of Fstop = 20 kHz, a passband attenuation of
%%%Apass = 5dB, and a stopband attenuation of Astop = 50dB.

Fs = 100;       %Leaving in kHz as freq will be normalized
Fpass = 10;
Fstop = 20;
Apass = 5;
Astop = 50;

%Generate Filter
n = buttord(2*Fpass/Fs, 2*Fstop/Fs, Apass, Astop);
[b, a] = butter(n, 2*Fpass/Fs);
%Filter
y = filter(b, a, signal);
%Take FFT
FFTy = fft(y, n);
FFTy = fftshift(abs(FFTy))/n;

F = Fs.*(-n/2:n/2-1)/n;
%Plotting
figure
plot(F,FFTy);
title('Butterworth Lowpass Filter');
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');
%%
%%%3. Create a Chebychev I highpass filter with a sampling frequency of Fs = 100 kHz, a passband
%%%frequency of Fpass = 35 kHz, a stopband frequency of Fstop = 15 kHz, a passband attenuation of
%%%Apass = 2dB, and a stopband attenuation of Astop = 40dB.

Fs = 100;       %Leaving in kHz as freq will be normalized
Fpass = 35;
Fstop = 15;
Apass = 2;
Astop = 40;

%Generate Filter
n = cheb1ord(2*Fpass/Fs, 2*Fstop/Fs, Apass, Astop);
[b, a] = cheby1(n,Apass, 2*Fpass/Fs, 'high');
%Filter
y = filter(b, a, signal);
%Take FFT
FFTy = fft(y, n);
FFTy = fftshift(abs(FFTy))/n;

F = Fs.*(-n/2:n/2-1)/n;
%Plotting
figure
plot(F,FFTy);
title('Chebychev I Highpass Filter');
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');
%%
%%%4. Create a Chebychev II bandstop filter with a sampling frequency of Fs = 100 kHz, a passband
%%%frequency of below the frequency Fpass1 = 5 kHz and above Fpass2 = 45 kHz, a stopband frequency
%%%of between Fstop1 = 15 kHz Fstop2 = 35kHz, a passband attenuation of Apass = 5dB, and a
%%%stopband attenuation of Astop = 50dB

Fs = 100;       %Leaving in kHz as freq will be normalized
Fpass1 = 5;
Fpass2 = 45;
Fstop1 = 15;
Fstop2 = 35;
Apass = 5;
Astop = 50;

%Generate Filter
n = cheb2ord([2*Fpass1/Fs,2*Fpass2/Fs] , [2*Fstop1/Fs, 2*Fstop2/Fs], Apass, Astop);
[b, a] = cheby2(n,Astop, [2*Fstop1/Fs, 2*Fstop2/Fs], 'stop');
%Filter
y = filter(b, a, signal);
%Take FFT
FFTy = fft(y, n);
FFTy = fftshift(abs(FFTy))/n;

F = Fs.*(-n/2:n/2-1)/n;
%Plotting
figure
plot(F,FFTy);
title('Chebychev II Stopband Filter');
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');


%%
%%%5. Create a Elliptic bandpass filter with a sampling frequency of Fs = 100 kHz, a stopband
%%%frequency of below the frequency Fstop1 = 15 kHz and above Fstop2 = 35 kHz, a passband
%%%frequency of between Fpass1 = 20 kHz Fpass2 = 30 kHz, a passband attenuation of Apass = 5dB,
%%%and a stopband attenuation of Astop = 50dB.

Fs = 100;       %Leaving in kHz as freq will be normalized
Fpass1 = 15;
Fpass2 = 35;
Fstop1 = 20;
Fstop2 = 30;
Apass = 5;
Astop = 50;

%Generate Filter
n = ellipord([2*Fpass1/Fs,2*Fpass2/Fs] , [2*Fstop1/Fs, 2*Fstop2/Fs], Apass, Astop);
[b, a] = ellip(n,Apass, Astop, [2*Fpass1/Fs, 2*Fpass2/Fs]);
%Filter
y = filter(b, a, signal);
%Take FFT
FFTy = fft(y, n);
FFTy = fftshift(abs(FFTy))/n;

F = Fs.*(-n/2:n/2-1)/n;
%Plotting
figure
plot(F,FFTy);
title('Elliptic Bandpass Filter');
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');