% fig 7
Iap  = 0.9:0.1:1.6;
Th   = 50+273.15;
e    = 1e-3;
l    = 4e-3;
Dtpd = 5;
PGeo = 1.5*linspace(0.5,1,9)*0.5e-3
NFic = 'if';

temp = zeros(1,length(Iap));
tens = temp;

for i = 1:length(Iap)
    crearicorr(Th,PGeo,l,Iap(i));
    inputsfeap(NFic,l)
    unix(['feap -i',NFic])
    x = load(['P',NFic(2:length(NFic)),'a.dis']);
    temp(i) = x(1,2);
    x = load('tresca');
    tens(i) = x(1,1);
end

vecintens   = linspace(Iap(1),Iap(length(Iap)),1e6);
[Tmin,pos1] = min(interp1(Iap,temp,vecintens,'spline'));
Iop         = vecintens(pos1);

save('Datos')
