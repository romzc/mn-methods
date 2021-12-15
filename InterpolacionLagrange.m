function InterpolacionLagrange (x,y, xi)
%Programa para interpolar usando los polinomios de lagrange
%introduccion de los vectores x, y
%x=input('Introduzca los valores del vector independiente x= ');
%y=input('Introduza los valores del vector dependiente y= ');
%xi=input('Introduzca el valor "xi" a interpolar= ');

if length(x) ~= length(y)
    errordlg("Se cometio un error en la entrada de datos");
    return 
end

respuesta = [];
aux = "";
%calculo de los coeficientes de los polinomios de Lagrange
m=length(x);
n=m-1;
L= zeros(m,m);
    for k=1:n+1
        v=1;
        for j=1:n+1
            if k~=j
                v=conv(v,poly(x(j)))/(x(k)-x(j));
            end
        end
        L(k,:)=v;
        aux = [aux;newline;"L =";newline;num2str(L)];
    end
    respuesta = respuesta;
    %disp('grado del polinomio n= '), disp(n)
    %disp('Los coeficientes del Polinomio de lagrange comenzando en An, An-1,...A1, A0 son igual a:')
    Coeficientes=y*L;
    respuesta = [
        "Resolucion";
        aux;
        "Grado del polinomio n =";
        num2str(n);
        "Coeficientes del Polinomio de lagrange: ";
        num2str(Coeficientes);
       ];
    

%mostramos el polinomio


%disp('El polinomio de interpolacion de Lagrange es igual a:');
b='P(x) = ';
i=n;
for a=Coeficientes
    if i==0
        b = b + string(a);
    else
        if(a >= 0)
            b = b + string(a) + 'x^' + string(i) + ' ';
        else
            b = b + string(a) + 'x^' + string(i) + ' ';
        end
    end
    i = i - 1;
end


respuesta = [respuesta; 
            newline;
            "El polinomio interpolador es igual";
            newline;
            b;
            newline;
            "El valor de yi en el polinomio es:";
            newline;
            polyval(Coeficientes,xi);
            ];
        
figu = figure;
set(figu,'MenuBar', 'none');
set(figu,'ToolBar','none');
text = uicontrol('Parent',figu,'Style','edit');
text.Position = [11 10 550 400];
text.Max = 30000;
text.Units = 'normalized';  
text.String =  respuesta;
%disp(b);
%disp(" ");
%disp('El valor de "yi" interpolado es igual a = '),disp(polyval(Coeficientes, xi));