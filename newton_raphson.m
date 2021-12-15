function newton_raphson(f_name, xo, iter_max, error )
% f_name: nombre de la funcion
% xo: xi inicial.
% err: error requerido.
% iter_max.
syms x;
f_name = str2sym(f_name);
g = diff(f_name); % Primera derivada
z = diff(g); %Segunda derivada

f_x = inline(f_name);
g_x = inline(g); 
z_x = inline(z);

row = 1:iter_max;
colum = {'xi','f(x)','error'};
data = {0 0 0};
figu = figure('name','Newthon-Raphson');
set(figu,'MenuBar', 'none');
set(figu,'ToolBar','none');

ui_table = uitable('columnname',colum,...
                    'rowname', row,...
                    'data',data,...
                    'position',[120 220 300 200]);


iter = 0;
xnew = xo;
err = 999;
% zona, condiciones de convergencia.
primerDeri = g_x(xo);
segundDeri = z_x(xo);
con = f_x(xo)*segundDeri;

% comprobar la caonvergencia antes de ingresar.
if primerDeri ~= 0 && segundDeri ~= 0 && con > 0
    while iter < iter_max && err > error
        y = f_x(xo)
        z = g_x(xo)
        
        %newData = {xnew y err};
        %if( iter ~= 0 )
        %    existingData = get(ui_table,'Data');
        %    newMatriz = [existingData; newData];
        %    newData = newMatriz;
        %    set(ui_table,'data',newData);
        %else
        %    set(ui_table,'data',newData);
        %end
        
        xnew = xo - y/z
       
        err = abs((xnew-xo)/xnew);
        y = f_x(xnew);
        newData = {xnew y err};
        if( iter ~= 0 )
            existingData = get(ui_table,'Data');
            newMatriz = [existingData; newData];
            newData = newMatriz;
            set(ui_table,'data',newData);
        else
            set(ui_table,'data',newData);
        end
        xo = xnew;
        iter = iter + 1;
        
        
    end
else
    fprintf('Error.. no converge');
end