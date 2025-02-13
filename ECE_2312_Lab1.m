
clear all
load handel; % the signal is in y and sampling freq in Fs
%sound(y,Fs); pause(10); % Play the original sound
alpha = 0.9; D = 4196; % Echo parameters
b = [1,zeros(1,D),alpha]; % Filter parameters
x = filter(b,1,y); % Generate sound plus its echo
%sound(x,Fs); % Play sound with echo

%Echo Removal: An echo removal system is given by the difference equation
% w[n] + αw[n − D] = x[n]
% where x[n] is the echo-corrupted sound signal and w[n] is the output
% sound signal, which has the echo (hopefully) removed. Note again that
% this system is very simple to implement in software or hardware.
w = filter(1,b,x);
%sound(w,Fs)
t = tiledlayout(1,2);%graph formatting
a1 = nexttile; %graph formatting
title('Impulse response h(n)')
xlabel('n') %n is the x-axis
ylabel('Response') %response is the y-axis
impz(b, 1, 0:4197) %run impz
a2 = nexttile;%graph formatting

n = -20:120; % create indexes
unit = unit_step(n); % get unit step

h = filter(b, 1, unit); % apply unit step to function

plot(a2,n, h) % plot step response
title('Unit Step Response');
xlabel('n');
ylabel('Response');
grid on;

function u = unit_step(n)
    u = (n >= 0); % returns 1 if n > greater than zero, else returns 0
end

