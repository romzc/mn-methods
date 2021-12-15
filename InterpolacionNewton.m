function InterpolacionNewton(x,y,xi)

%interpolacion de newton
%function[yi,p,b]=inter_newton(x,y,xi)
%Inicializacion de variables
%x=input('Introduzca el vector independiente "x"= ');
%y=input('Introduza el vector dependiente "y"= ');
%xi=input('Introduzca el valor "xi" a interpolar= ');

if length(x) ~= length(y)
    errordlg("Se cometio un error en el ingreso de datos");
    return;
end

n=length(x);
b=zeros(n);
b(:,1)=y(:);
%obtencion de la tabla de diferencias finitas
%disp('obtencion de la tabla de diferencias finitas')

aux = "";



for j=2:n
    for i=1:n-j+1
        b(i,j)=(b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
        aux = [aux;"b=";num2str(b)];
    end
end


respuesta = ["Resolucion";aux];

%calcula el dato interpolado
%disp('valor de "y" interpolado:')
x1=1;
yi=b(1,1);
for j=1:n-1
    x1=x1.*(xi-x(j));
    yi=yi+b(1,j+i)*x1;
end
respuesta = [respuesta;"El valor de 'yi' interpolado es igual a:";yi];
%disp('El valor de "yi" interpolado es igual a = '),disp(yi);
%Construye el polinomio
p=num2str(b(1,1));
xx=x*-1;
for j=2:n
    signo='';
    if b(1,j)>=0
        signo='+';
    end
    x1='';
    for i=1:j-1
        signo2='';
        if xx(i)>=0
            signo2='+';
        end
        x1=strcat(x1,'*(x',signo2,num2str(xx(i)),')');
    end
    p=strcat(p,signo,num2str(b(1,j)),x1);
end

respuesta = [respuesta;newline;
            "El polinomia de interpolacion de Newton es igual a:";
            char(inline(p));newline];
        
figu = figure;
set(figu,'MenuBar', 'none');
set(figu,'ToolBar','none');
text = uicontrol('Parent',figu,'Style','edit');
text.Position = [11 10 550 400];
text.Max = 30000;
text.Units = 'normalized';  
text.String =  respuesta;   

%disp('El polinomio de interpolacion de Newton es igual a:');
%P=inline(p)