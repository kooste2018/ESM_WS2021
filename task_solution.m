% this single .m script is the solution for all tasks.
clear
clc
% task 1, download and select data from the 5 stations
alldata=readtable('NO2_2021_12.xlsx');
allstations=alldata.Properties.VariableNames;
stations=allstations(find(contains(allstations,'M_nchen')));%selected stations names
N=numel(stations);
data=alldata(:,[{'Zeitpunkt'},stations]);%selected data including time
% task 2, convert to ppm, formular see https://www.teesing.com/en/page/library/tools/ppm-mg3-converter
% concentration (ppm) = 24.45 x concentration (mg/m3) ÷ molecular weight
% concentration (ppb) = 24.45 x concentration (\mu g/m3) ÷ molecular weight
for i=1:N
    data.(stations{i})=data.(stations{i})*24.45/46;
end
% task 3, plot last two days ppm in one plot. but there is no data on
% 31.12. thus I choose data from 29. and 30. December 
data29=find(contains(data.Zeitpunkt,'29.12.2021'));
data30=find(contains(data.Zeitpunkt,'30.12.2021'));
plotdata=data([data29;data30],:);
figure(1)
t=datetime(plotdata{:,1});
for i=1:N
    a=plotdata{:,i+1};
    plot(t,a);
    hold on
end
xlabel('time')
ylabel('NO2 ppm')
legend(stations)
title('Dec. 29. and 30. NO2 data from 5 stations')
% task 4, correlation with traffic data
traffic=readtable('traffic.csv');
figure(2)
t=datetime(plotdata{:,1});
for i=1:N
    a=plotdata{:,i+1};
    plot(t,a,'-');
    hold on
end
for i=1:3
    a=traffic{i,4:end}/500;
    b=[a,a];% repeat for two days, assume traffic data doesn't change
    plot(t,b,':');
    hold on
    alldaytraffic=repmat(traffic{i,3}/5000,size(b));
    plot(t,alldaytraffic,'--');
    hold on
end
xlabel('time')
ylabel('NO2 ppm and scaled traffic data')
legend([stations,'Landshuter Allee traffic per hour', 'Landshuter Allee traffic all day',...
    'Lothstraße traffic per hour', ' Lothstraße traffic all day','Stachus traffic per hour','Stachus traffic all day']);
title('Dec. 29. and 30. NO2 data from 5 stations with traffic data')
% task 5
average_ppm=cell(1,N);
for i=1:N
    average_ppm{i}=mean(plotdata{:,i+1});
end
average_ppm=[stations;average_ppm];

