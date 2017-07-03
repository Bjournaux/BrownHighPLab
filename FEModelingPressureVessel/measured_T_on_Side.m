data=[13.25 nan 251.22
    13  251.48 251.16
    12.5 251.55 251.30
    12 251.54 251.34
    11.5 251.49 251.29
    11 251.42 251.29
    10.5 251.35 251.16
    10 251.28 251.10
    9.5 251.23 251.05
    9 251.20 251.03
    8.5 251.19 251.01
    8 251.21 251.04
    7.5 251.25 251.07
    7 251.33 251.13
    6.5 251.41 251.21
    6 251.52 251.31
    5.5 251.72 251.53
    4. 252.09 251.88
    3.7 252.85 252.56
    3.4 254.48 254.17
    3.3 255  256
    ];


data(:,1)=(-2.4-data(:,1))*.0254;
data(:,3)=data(:,3)+.18;

coef=polyfit(data([2:end-3 end],1),data([2:end-3 end],2),6);
txt=sprintf('%e*y.^6 + (%e*y.^5) +(%e*y.^4) +(%e*y.^3) +(%e*y.^2) +(%e*y.^1) +(%e)-273.15',coef);
xc=linspace(-.4,-.14,100);
yc=polyval(coef,xc);

plot(data(:,1),data(:,2:3),'o',xc,yc)
xlabel('Position (m)')
ylabel('Temeprature (K)')