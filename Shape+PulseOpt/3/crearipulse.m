function crearipulse(PuntosPulso,Dtpd,dtc)

it = dtc/10;

fid=fopen('iparpul','w');
fprintf(fid,'PARAmeter \n');
fprintf(fid,'dc = %e \n',dtc);
fprintf(fid,'fc = %e \n',it+(Dtpd*1.8));
fprintf(fid,'ft = %e \n',it+Dtpd);
fprintf(fid,'it = %e \n',it);
if Dtpd < 4
    fprintf(fid,'f2 = %e \n',it+(Dtpd*10));
else
    fprintf(fid,'f2 = %e \n',it+(Dtpd*8));
end
fprintf(fid,'\n');
fclose(fid);

vectorinicial = zeros(1,5);
pasos = logspace(log10(it),log10(dtc),6);
for i = 1:5
    vectorinicial(i) = sum(pasos(1:i));
end

m   = length(PuntosPulso);
pro = pchip(linspace(it,it+Dtpd,m),PuntosPulso,...
    [vectorinicial,(2*dtc+it:dtc:it+Dtpd)]');

save('ipulse','pro','-ascii')
