function RegresionLinear (x,y)
if length(x) ~= length(y)
    errordlg("Los vectores no son del mismo tamaño");
end
plot(x,y,'dk');

minX = min(x); maxX = max(x);
minY = min(y); maxY = max(y);

xlabel('Eje x'); ylabel('Eje y'); title('Regresion Lineal');
axis([minX-1 maxX+1, minY-1 maxY+1]); grid on; hold on;

n = length(x); % Es el numero de datos.
%sumxi_yi : sumatoria de xi*yi
%sumxi    : sumatoria de xi
%sumaxi_2 : sumatoria de xi^2
%cuadrado_sumx1 : cuadrado de la sumatorio de xi
%sum_yi   : sumatoria de yi 


sumxi_yi = sum(x.*y);
sumxi = sum(x);
sumxi_2 = sum(x.^2);
cuadrado_sumxi = (sumxi)^2;
sumyi = sum(y);


% calculando a1.
a1 = ((n*sumxi_yi)-(sumxi*sumyi))/(n*sumxi_2-cuadrado_sumxi);
y_test = mean(y);
x_test = mean(x);

%calculando a0
a0 = y_test-a1*x_test;

linea_ajuste = a0+a1*x;
caption = sprintf('f = %f*x + %f',a1,a0);
text(0,1,caption,'FontSize',10);

plot(x,linea_ajuste,'r--'); legend('conjunto de datos','linea de ajuste');
