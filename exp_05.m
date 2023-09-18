% PROBLEM 1
alpha= mod(284,3);
Fs=100; %sample frequency
T=10; % durection
t=0:1/Fs:T-1/Fs;
in_value=2+2*alpha; %
fin_value=5+5*alpha;
slope=(fin_value-in_value)./T; %slop of F(t)
F_t=slope*t + in_value;  %F(t) function
x_t=sin(2*pi*F_t.*t); %chirp signal function
% Q1_1
figure;
 plot(t,x_t)
 xlabel('Time (seconds)');
ylabel('Amplitude');
title('Chirp Signal x(t)');
grid on;
 % hold on;
% Q1_2
N=length(x_t);
frequencies=-Fs/2:Fs/N:Fs/2-Fs/N;
X_f=fftshift(fft(x_t,N));
figure;
plot(frequencies,abs(X_f))
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum');
grid on;

% Q1_3
% window_type='blackman';
window_lengths=[100,150,200];
for i=1:length(window_lengths)
window_length=window_lengths(i);
overlap=10;
figure;
spectrogram(x_t, blackman(window_length), overlap, Fs, 'yaxis');
end


PROBLEM 2
% Load the audio file
audio_file = 'instru3.wav';
[y, fs] = audioread(audio_file);

% Plot the spectrogram
figure;
spectrogram(y, hamming(512), 256, 512, fs, 'yaxis');
title('Spectrogram of Audio Signal');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
% Plot the conventional spectrum
figure;
N = length(y);
frequencies = linspace(0, fs, N);
spectrum = abs(fft(y));
spectrum = spectrum(1:N/2+1); % Take the positive half of the spectrum
plot(frequencies(1:N/2+1), 20*log10(spectrum));
title('Conventional Spectrum of Audio Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

% Load the audio file

[y, fs] = audioread('Opera.wav');

% Plot the spectrogram
figure;
spectrogram(y, hamming(512), 256, 512, fs, 'yaxis');
title('Spectrogram of "opera.wav"');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

% PROBLEM 3
fs = 4000; % Sampling rate 
duration = 5; % Duration of the recording 
% Create an audio recorder object
recObj = audiorecorder(fs, 16, 1); % 16-bit, mono
% Start recording
disp('Start speaking...');
recordblocking(recObj, duration);
disp('End of recording.');
% Store the recorded audio data
audioData = getaudiodata(recObj);
% Save the recorded audio as a .wav file
filename = 'madhu.wav';
audiowrite(filename, audioData, fs);
% Display a message indicating the file has been saved
disp(['Audio saved as ' filename]);
% Load the recorded audio with the lower sampling rate
audio_file = 'madhu.wav';
[y, fs] = audioread(audio_file);
% Plot the spectrogram
figure;
spectrogram(y, hamming(512), 256, 512, fs, 'yaxis');
title('Spectrogram of Recorded Name');
xlabel('Time (s)');
ylabel('Frequency (Hz)');