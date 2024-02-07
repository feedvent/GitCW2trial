% Insert name here
% Insert email address here

%Preliminary steps
a = arduino('com5', 'uno');

%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
%clear all

%b
%Duration of data collection in seconds
duration = input('How many seconds should the data acquisition last?')

%c
% Pre-allocate arrays
voltage = zeros(1,duration);
time = linspace(1,duration,duration);

%Store voltage values
for i = 1:duration
voltage(i) = readVoltage(a, 'A0');
time(i) = i;
pause(1);
end

%Convert voltage to degrees celsius
temp = (voltage-0.5)*100; 

%Extract statistical quantities
maxtemp=max(temp);
mintemp=min(temp);
meantemp=mean(temp);

%Create the temperature/time plot
plot(time, temp);
xlabel('Time (s)');
ylabel('Temperature (C)');

%d
%Write data log on screen
sprintf('Data logging initiated - 5/3/2024 \nLocation - Nottingham \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMax temp \t%.2f C \n\nMin temp \t%.2f C \n\nAvg temp \t%.2f C \n\nData logging terminated', time(1)-1, temp(1), time(60)/60, temp(60), time(120)/60, temp(120), time(180)/60, temp(180), time(240)/60, temp(240), time(300)/60, temp(300), time(360)/60, temp(360), time(420)/60, temp(420), time(480)/60, temp(480), time(540)/60, temp(540), time(600)/60, temp(600), maxtemp, mintemp, meantemp) 

%e
%Write data log to file
cabinT_id=fopen('cabin_temperature.txt', 'w');
fprintf(cabinT_id,'Data logging initiated - 5/3/2024 \nLocation - Nottingham \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMinute \t\t\t%d \nTemperature \t%.2f C \n\nMax temp \t%.2f C \n\nMin temp \t%.2f C \n\nAvg temp \t%.2f C \n\nData logging terminated', time(1)-1, temp(1), time(60)/60, temp(60), time(120)/60, temp(120), time(180)/60, temp(180), time(240)/60, temp(240), time(300)/60, temp(300), time(360)/60, temp(360), time(420)/60, temp(420), time(480)/60, temp(480), time(540)/60, temp(540), time(600)/60, temp(600), maxtemp, mintemp, meantemp) 
fclose(cabinT_id);
