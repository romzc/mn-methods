% @author: rventurar@unsa.edu.pe
% Metodo Biseccion 
function bisec_m(tol,it_limit,f_name,a,c)
% tol: tolerancio del ejercicio.
% it_limit: # iteraciones
% f_name: Funcion a analizar
% a - c: Valores entre los cuales se encuentra una raiz.
format short;
syms x;
%fprintf ('Metodo de la biseccion:\n\n');
%fplot(f_name,'g', 'linewidth', 2);
%grid on;
% col: cabecera de la tabla.


col = {'Xi','Xd','Xr','f(Xi)', 'f(Xd)','f(Xr)','e'};
% row: # iteraciones maximo
row = 1:it_limit;

%Primeros valores de la fila 1.
f_name = inline(f_name);
y_a = f_name(a);
y_c = f_name(c);
b=(a + c)/2;
y_b = f_name(b);
dat = {a c b y_a y_c y_b 0};

if( y_a * y_c > 0)
    errordlg('No cumple f(a)*f(c) > 0');
end

% u_table: Tabla para mostrar los resultados de las iteraciones.
f = figure('Name','Metodo Biseccion');
set(f,'MenuBar', 'none');
set(f,'ToolBar','none');


u_table = uitable('columnname',col,'rowname',row,'data',dat,'position',[0 0 600 400]);
error = 0;
it=0;
if (y_a*y_c>0)
    errordlg('\n\n Detenido porque f(a)*f(c) > 0 \n');
else
    while it < it_limit
        it = it + 1; b=(a + c)/2;
        y_b = f_name(b);
        
        % Actualizamos la tabla de ui apartir del contador 2.
        
        if it > 1
            error = abs((b-bOld)/b);
            if error <= tol
                break; 
            end
        end
        
        if it == 1
            newData = {a c b y_a y_c y_b NaN};
            set(u_table,'data',newData);
        else
            existingData = get(u_table,'Data');
            newRow = {a c b y_a y_c y_b error};
            newData = [existingData; newRow];
            set(u_table,'Data',newData);
        end
        
        if (y_a*y_b<=0)
            c=b;   y_c=y_b;
        else
            a=b;   y_a=y_b;
        end
        bOld = b;
    end
    %fprintf ('Resultado: Raiz=%12.6f  \n', b);
end