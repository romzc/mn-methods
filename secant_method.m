function secant_method(f_name,x0,x1,er,max_iter)
%xa; % aproximacion inicial 1
%xb; % aproximación inicial 2

f_x = inline(f_name);

fig = figure('name','Método Secante');
set(fig,'MenuBar', 'none');
set(fig,'ToolBar','none');

col = {'x','f(x)','e'};
row = 1:max_iter;
data = { x0 f_x(x0) NaN;x1 f_x(x1) abs((x1-x0)/x1)*100};
ui_table = uitable('columnname',col,...
                    'rowname',row,...
                    'data', data,...
                    'position',[120 220 300 200]);
iter = 1;
err = 9;

while iter < max_iter && err > er
    fx1 = f_x(x1);
    fx0 = f_x(x0);
    x2 = x1 - ((fx1*(x0-x1))/(fx0-fx1));
    err = abs(((x2 - x1)/x2)*100);
    
    % Seccion de la interfaz, modifica la tabla.
    newData = {x2, f_x(x2) err};
    existingData = get(ui_table,'Data');
    newMatriz = [existingData; newData];
    newData = newMatriz;
    set(ui_table,'data',newData);
    % ------------------------------------------
    x0 = x1;
    x1 = x2;
    iter = iter + 1;
end
end