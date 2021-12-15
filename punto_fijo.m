function punto_fijo( f_name,g_name,xo, err, iter_max )
% f_name: Aplicar a la funcion f_name.
% f_g: Descomposción de la funcion f_name.
% iter_max: Numero de iteraciones.
% xo: Punto de partida
% err: error

% Partes de la interfaz.
% Convergencia
syms x;
converge = str2sym(g_name);
converge = diff(converge);
converge = inline(converge);
valor = converge(xo);

if abs(valor) >= 1
    fprintf('No converge---');
    return;
end

f_name = inline(f_name);
g_name = inline(g_name);
col = {'x','g(x)','f(x)','e'};
row = 1:iter_max;
dat = {0,0,0,0};
f = figure('Name','Punto Fijo');
set(f,'MenuBar', 'none');
set(f,'ToolBar','none');

ui_table = uitable('columnname',col,...
                    'rowname',row,...
                    'data', dat,...
                    'position',[0 0 600 400]);

% Seccion propia del metodo.
xr = xo;
iter = 0;
es = 9999;
while (iter < iter_max && err < es)
    xrold = xr;
    % Evaluamos las funciones gx, fx en xo.
    xr = g_name(xrold);
    xf = f_name(xrold);
    
    newData = {xrold, xr, xf, es};
    if ( iter ~= 0 )
        existingData = get(ui_table,'Data');
        newMatriz = [existingData; newData];
        newData = newMatriz;
        set(ui_table,'data',newData);
    else
        newData = {xrold, xr, xf, NaN};
        set(ui_table,'data',newData);
    end
    
    iter = iter + 1;
    if xr ~= 0
        es = abs((xr - xrold)/xr);
    else
        return;
    end
end
end