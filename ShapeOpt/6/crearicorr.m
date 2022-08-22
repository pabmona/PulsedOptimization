function crearicorr(Th,PuntosGeo,l)
% Función que permite crear un fichero que guarda la intensidad que
% maximiza la diferencia de temperaturas entre la temperatura en el foco
% caliente y el foco frío para diferentes formas de termoelemento.

load re_stepped
cint = linspace(0.375e-3,0.75e-3,4);
lint = linspace(2.5e-3,7e-3,4);
ImxAp = interpn(cint,cint,cint,cint,cint,cint,cint,cint,cint,lint,regr,...
    PuntosGeo(1),PuntosGeo(2),PuntosGeo(3),PuntosGeo(4),PuntosGeo(5)...
    ,PuntosGeo(6),PuntosGeo(7),PuntosGeo(8),PuntosGeo(9),l);

% Regresión de ImxAp con parámetros geométricos

a0 = 1.988e-4;
a1 = 3.53e-7;
a2 = 7.521e-10;
r0 = 9.0404e-06;
r1 = 4.32661e-08; 
r2 = 2.55746e-11;
k0 = 1.663;
k1 = -3.58e-3;
k2 = 3.195e-5;

% Modificación del número de elementos con la altura.
nT = 32;

fid=fopen('icorr','w');
fprintf(fid,'PARAmeter \n');
fprintf(fid,'Th = %e \n',Th-273.15);
fprintf(fid,'a0 = %e \n',a0);
fprintf(fid,'a1 = %e \n',a1);
fprintf(fid,'a2 = %e \n',a2);
fprintf(fid,'r0 = %e \n',r0);
fprintf(fid,'r1 = %e \n',r1);
fprintf(fid,'r2 = %e \n',r2);
fprintf(fid,'k0 = %e \n',k0);
fprintf(fid,'k1 = %e \n',k1);
fprintf(fid,'k2 = %e \n',k2);
fprintf(fid,'jz = %e \n',ImxAp);
fprintf(fid,'L1 = %e \n',PuntosGeo(1));
fprintf(fid,'L2 = %e \n',PuntosGeo(2));
fprintf(fid,'L3 = %e \n',PuntosGeo(3));
fprintf(fid,'L4 = %e \n',PuntosGeo(4));
fprintf(fid,'L5 = %e \n',PuntosGeo(5));
fprintf(fid,'L6 = %e \n',PuntosGeo(6));
fprintf(fid,'L7 = %e \n',PuntosGeo(7));
fprintf(fid,'L8 = %e \n',PuntosGeo(8));
fprintf(fid,'L9 = %e \n',PuntosGeo(9));
fprintf(fid,'nT = %i \n\n',nT);
fclose(fid);
