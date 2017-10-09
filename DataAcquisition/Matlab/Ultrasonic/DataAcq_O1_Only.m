% DataAcquisition renames spectra files with pressure and
% temperature averages taken from LabView log files, runs the renamed files through the Load_Window_Signal, transferfunction, and ultrasonicspeed
% functions, and then adds data to a structure

peaks = [1 2 3 4 ];

spectraNum = input('Spectra number? ');
filename = spectraNum;

if isempty(filename)
    error('Enter an integer');
end

filename = num2str(filename);


     if length(filename) == 1
         filename = strcat('x00',filename);
     elseif length(filename) == 2
         filename = strcat('x0',filename);
     elseif length(filename) == 3
         filename = strcat('x', filename);
     else
         error('Enter an integer')
     end

 

% If the spectra already has a full filename, use the existing filename. If using existing filename, nameswitch = 1 
x = dir;
 
     for i = 1:length({x.name})
         if length(x(i).name) > 8 && isequal(x(i).name(1:4), filename(1:4))
             filename = x(i).name;
             nameswitch = 1;
         end
     end
    
     


         
     if ~exist('nameswitch')
        filename = strcat(filename, '.mat');
     end
%% Find and move labview log files from Ultrasonic drive to working folder 'DataAcquisition'

% Loading spectra file
load(filename)
clear dt signal

% Declaring datenum input and output formats
formatIn = 'mm/dd/yyyy HH:MM PM';
formatOutdate = 'yyyymmdd';
formatOuttime = 'HH:MM:SS PM';

% Creating date and time strings from spectra file
spectradatetime = datenum(sprintf('%s %s', date, time), formatIn);
filedate = datestr(spectradatetime,formatOutdate);
% UPDATE BOLLENGIER JUNE 2017 - for spectra acquired after midnight
% filedate = num2str(str2num(filedate)-1);

% Saving directory of experiment, declaring working folder for log files to
% be copied into
expDir = pwd;
workingDir = '/Users/penny/Desktop/DataAcquisition';

Omega1filename = strcat(filedate, '_100KPSI.txt');
Ch2filename = strcat(filedate, '_CH1_CH2_Corr.txt');
RoomTfilename = strcat(filedate, '_CH3.txt');


    clear z

% Copy raw spectra files, paste to DataAcquisition folder 
copyfile(Omega1filename, strcat(workingDir,'/Omega1.txt')) 
copyfile(Ch2filename, strcat(workingDir, '/Ch2.txt'))
copyfile(RoomTfilename, strcat(workingDir, '/RoomT.txt'))


% Redefining file names with new copied files 
Omega1filename = strcat(workingDir,'/Omega1.txt');
Ch2filename = strcat(workingDir, '/Ch2.txt');
RoomTfilename = strcat(workingDir, '/RoomT.txt');


%% Find time stamp from spectra of interest

% Importing data from .txt log files
Omega1 = importdata(Omega1filename);
Ch2 = importdata(Ch2filename);
RoomT = importdata(RoomTfilename,'\t');


% Getting rid of unnecessary data from the logs. (Uncorrected data, Ch1 etc.) 
Omega1 = {Omega1.textdata, Omega1.data(:,7), Omega1.data(:,2)};
Ch2 = {Ch2.textdata, Ch2.data(:,3)};
RoomT = {RoomT.textdata, RoomT.data(:,1)};


% Getting rid of sub-seconds in log file times for logical operations further down in the script

x = Omega1{1};

    for i = 1:length(x)
        if x{i}(5) == ':'
        x{i} = strcat(x{i}(1:7), x{i}(12:end));
        else
        x{i} = strcat(x{i}(1:8), x{i}(13:end));
        end
    end
% Converting date and time strings to serial date numbers 
Omega1{1} = datenum(x); %datenum(datetime(x,'InputFormat','h:mm:ss a M/d/y'));




    
x = Ch2{1};
    for i = 1:length(x)
        if x{i}(5) == ':'
        x{i} = strcat(x{i}(1:7), x{i}(12:end));
        else
        x{i} = strcat(x{i}(1:8), x{i}(13:end));
        end
    end
Ch2{1} = datenum(x);

x = RoomT{1};
    for i = 1:length(x)
        if x{i}(5) == ':'
        x{i} = strcat(x{i}(1:7), x{i}(12:end));
        else
        x{i} = strcat(x{i}(1:8), x{i}(13:end));
        end
    end
RoomT{1} = datenum(x);

%% Selecting range of log entries to average/fit 

% Using min function to find the log entry closest to the time the spectra was taken, and then
% selecting the 5 before and 5 after this log entry
[~,Omega1index] = min(abs(Omega1{1} - spectradatetime));
[~,Ch2index] = min(abs(Ch2{1} - spectradatetime));
[~,RoomTindex] = min(abs(RoomT{1} - spectradatetime));

if Omega1index+5 > length(Omega1{1}) || Ch2index+5 > length(Ch2{1}) || RoomTindex+5 > length(RoomT{1})
    error('There aren''t enough Labview log entries immediately after the spectra to take an average. Wait a few seconds and try again.')
end



Omega1{1} = Omega1{1}(Omega1index-5:Omega1index+5);
Omega1{2} = Omega1{2}(Omega1index-5:Omega1index+5);
Omega1{3} = Omega1{3}(Omega1index-5:Omega1index+5);
Ch2{1} = Ch2{1}(Ch2index-5:Ch2index+5);
Ch2{2} = Ch2{2}(Ch2index-5:Ch2index+5);
RoomT{1} = RoomT{1}(RoomTindex-5:RoomTindex+5);
RoomT{2} = RoomT{2}(RoomTindex-5:RoomTindex+5);

Omega1{1} = string(datestr(Omega1{1}, formatOuttime));
Ch2{1} = string(datestr(Ch2{1}, formatOuttime));
RoomT{1} = string(datestr(RoomT{1}, formatOuttime));

% Getting rid of zeros in selection
idO1 = find(Omega1{3} == 0);
Omega1{1}(idO1) = [];
Omega1{2}(idO1) = [];
Ch2{1}(idO1) = [];
Ch2{2}(idO1) = [];
RoomT{1}(idO1) = [];
RoomT{2}(idO1) = [];



%% Calculating averages

Omega1avg = sum(Omega1{2})/length(Omega1{2});
Ch2avg = sum(Ch2{2})/length(Ch2{2});
RoomTavg = sum(RoomT{2})/length(RoomT{2});


%% Fitting selected log data

% Omega 1
% Converting strings to scaled times using datetime
O1tActual = datenum(char(Omega1{1}));
O1t = datenum(char(Omega1{1}));
% Normalizing
O1t = (O1t - datenum(time))*1e4;
ttime = 0;
O1w = polyfit(O1t,Omega1{2},1);
O1y = polyval(O1w,O1t); 
interpO1 = polyval(O1w,ttime);
O1STD = std(Omega1{2});


    
% Ch2    
Ch2tActual = datenum(char(Ch2{1}));
Ch2t = datenum(char(Ch2{1}));
Ch2t = (Ch2t - datenum(time))*1e4;
Ch2w = polyfit(Ch2t,Ch2{2},1);
Ch2y = polyval(Ch2w,Ch2t); 
interpCh2 = polyval(Ch2w,ttime);
Ch2STD = std(Ch2{2});

% RoomT
RoomTtActual = datenum(char(RoomT{1}));
RoomTt = datenum(char(RoomT{1}));
RoomTt = (RoomTt - datenum(time))*1e4;
RoomTw = polyfit(RoomTt,RoomT{2},1);
RoomTy = polyval(RoomTw,RoomTt);
interpRoomT = polyval(RoomTw,ttime);
RoomTSTD = std(RoomT{2});



%% Renaming file based on Omega 1 and Ch 2 interpolation

if ~exist('nameswitch')

    Omega1name = string(round(interpO1,2));
        z = [];
        for i = 1:length(Omega1name{1})
            if Omega1name{1}(i) == '.'
                Omega1name{1}(i) = 'p';
                z(end+1) = 1;
            end
        end
        if isempty(z)
            Omega1name = Omega1name + 'p00';
        end

    Ch2name = string(round(interpCh2,2));
        z = [];  
        for i = 1:length(Ch2name{1})
            if Ch2name{1}(i) == '.'
                Ch2name{1}(i) = 'p';
                z(end+1) = 1;
            end
        end
        if isempty(z)
            Ch2name = Ch2name + 'p00';
        end

    cd(expDir)
    filenameabr = filename(1:4);
    newname = char(strcat(filenameabr, '_', Ch2name, '_', Omega1name, '.mat'));

        if ~isequal(filename, newname)
        copyfile(filename, newname)
        end
        filename = newname(1:end-4);

else 

    filename = filename(1:end-4);    

end

%% Running Ultrasonic scripts with updated filename

UltraSonicStrc=Load_Window_Signal(filename,2,3.5,10.77,'n');
UltraSonicStrc=TransferFunction(UltraSonicStrc,1,'TD','p',1);
UltraSonicStrc=UltraSonicSpeed(UltraSonicStrc,peaks,'y');



%% Plotting Omega 1


figure('units','normalized','position',[.5 .5 .3 1])

    subplot(211)

% Plotting Omega 1 data
plot(O1t, Omega1{2},'o', 'MarkerFaceColor', 'b')

% Making x axis ticks scale to time and labeling them with strings
set(gca, 'Xtick', O1t)
set(gca, 'XtickLabel', {Omega1{1}{1:2:length(Omega1{1})}})
set(gca, 'XtickLabelRotation', 45)
hold on

% Fitting data and plotting
plot(O1t,O1y)
hold on

% Plotting the linear fit evaluated at time of spectra
plot(ttime, interpO1, 'k*')
hold on 

% Adding a reference line with slope = 0 and y int = Omega 1 average
z = refline(0,Omega1avg);
z.LineStyle = '--';
z.Color = [.5 .5 .5];

% Calculating slope of linear fit and standard dev of Omega 1 set
O1y1 = O1y(1);
O1y2 = O1y(2);
O1slopetime = O1tActual(2)-O1tActual(1);
O1slopetime = datestr(O1slopetime, 'SS');
O1slopetime = str2num(O1slopetime);
slopeO1 = (O1y2-O1y1)/O1slopetime;
slopeO1disp = slopeO1*1e3;
O1STD = std(Omega1{2});
O1STDdisp = 1e3*O1STD;

% Adding Slope and STD text to plot 
ax = gca;
xcon = (ax.XLim(2) - ax.XLim(1))/16;
ycon = (ax.YLim(2) - ax.YLim(1))/16;
t1 = text(ax.XLim(1) + xcon, ax.YLim(2) - ycon, sprintf('Slope: %0.1f kPa/min', 60*slopeO1disp), 'FontSize', 15);
t1.Color = [0 0 0];
t1.FontWeight = 'bold';
ycon = (ax.YLim(2) - ax.YLim(1))/9;
t2 = text(ax.XLim(1) + xcon, ax.YLim(2) - ycon, sprintf('STD: %0.1f kPa', O1STDdisp), 'FontSize', 15);
t2.Color = [0 0 0];
t2.FontWeight = 'bold';

title('Omega 1')
legend('Omega 1 log readings', 'Linear fit of Omega 1', 'Polynomial evaluated at time of spectra', 'Omega 1 average', 'Location', 'southeast')







%% Plotting Ch2
subplot(212)


ttime = 0;
% Plotting Omega 1 data
plot(Ch2t, Ch2{2},'o', 'MarkerFaceColor', 'b')
% Making x axis ticks scale to time and labeling them with strings
set(gca, 'Xtick', Ch2t)
set(gca, 'XtickLabel', {Ch2{1}{1:2:length(Ch2{1})}})
set(gca, 'XtickLabelRotation', 45)
hold on
% Fitting data and plotting
plot(Ch2t,Ch2y)
hold on
% Plotting the linear fit evaluated at time of spectra
plot(ttime, interpCh2, 'k*')
hold on 
% Adding a reference line with slope = 0 and y int = Ch2 average
z = refline(0,Ch2avg);
z.LineStyle = '--';
z.Color = [.5 .5 .5];
% Calculating slope of linear fit and standard dev of Ch2 set
Ch2y1 = Ch2y(1);
Ch2y2 = Ch2y(2);
Ch2slopetime = Ch2tActual(2)-Ch2tActual(1);
Ch2slopetime = datestr(Ch2slopetime, 'SS');
Ch2slopetime = str2num(Ch2slopetime);
slopeCh2 = (Ch2y2-Ch2y1)/Ch2slopetime;
slopeCh2disp = slopeCh2*1e3;
Ch2STD = std(Ch2{2});
Ch2STDdisp = 1e3*Ch2STD;

% Setting up text to display slope of line and STD of Ch2 set
ax = gca;
xcon = (ax.XLim(2) - ax.XLim(1))/16;
ycon = (ax.YLim(2) - ax.YLim(1))/16;
t1 = text(ax.XLim(1) + xcon, ax.YLim(2) - ycon, sprintf('Slope: %0.1f mK/min', 60*slopeCh2disp), 'FontSize', 15);
t1.Color = [0 0 0];
t1.FontWeight = 'bold';
ycon = (ax.YLim(2) - ax.YLim(1))/9;
t2 = text(ax.XLim(1) + xcon, ax.YLim(2) - ycon, sprintf('STD: %0.1f mK', Ch2STDdisp), 'FontSize', 15);
t2.Color = [0 0 0];
t2.FontWeight = 'bold';

title('Ch 2')
legend('Ch 2 log readings', 'Linear fit of Ch 2', 'Polynomial evaluated at time of spectra', 'Ch 2 average', 'Location', 'southeast')


%%
fprintf('\n');
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \n');
fprintf(' SPECTRA: %.0f \n', spectraNum);
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \n');
fprintf(' Time: %s \n', string(time));
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \n');
fprintf(' Ch2: %.2f \n', round(Ch2avg,2));
fprintf(' Omega1: %.2f \n', round(Omega1avg,2));

fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

            

%% Adding data to UltraSonicStrc

UltraSonicStrc.Omega1 = Omega1;
UltraSonicStrc.Ch2 = Ch2;
UltraSonicStrc.Omega1STD = O1STD;
UltraSonicStrc.Ch2STD = Ch2STD;
UltraSonicStrc.RoomT = RoomT;
UltraSonicStrc.RoomTSTD = RoomTSTD;

UltraSonicStrc.Omega2 = {};
UltraSonicStrc.Omega2STD = [];

savename = UltraSonicStrc.filename;
save(savename, 'UltraSonicStrc')



%% Adding data to structure

database
clearvars -except data UltraSonicStrc
