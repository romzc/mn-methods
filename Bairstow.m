
function Bairstow(a, r, s, cota)
    raices_pol=[];
    raices_pol=Roots(r,s,a,cota);
    raices_pol';
    complex_ans=[real(raices_pol); imag(raices_pol)];
    fprintf(" \t las raices son %4.2f + %4.2f j \n",complex_ans)
    % comparación respecto a la función de Matlab
    roots(a)
end

%% Parametros
%clear, clc 
%   a:   coeficientes del polinomio [a_n, a_{n-1}, ... , a_1, a_0]
%a=[1, 1, 1, 2,0,0];

%a=[1, -3.5, 2.75, 2.125, -3.875, 1.25]

%r=-1;                        % valor inicial r
%s=-1;                        % valor inicial s
%cota= 10^-4;                % cota de error

%raices_pol=[];              % inicialización variable respuesta

%% Desarrollo
% Para conocer más información de ciertas funciones se puede usar el
% comando edit para ver la implementación del codigo esta limitada a 
% ciertas funciones pues matlab al ser de codigo cerrado no permite el
% acceso a las funciones que hacen parte de su componente basico

% edit roots
% edit polyfit

%% Funciones

function b=coeficientes(a,r,s)
    % [a_n , a_{n-1}, ...a_1, a_0} 
    b=[];
    b(1)=a(1);
    b(2)=a(2) + r*b(1);
    
    for i=3:length(a)
        b(i)= a(i) + r*b(i-1) + s*b(i-2); 
    end
    
end


function [dr,ds]=update(c,b)
    Jacobiana=[c(end-2),c(end-3); c(end-1), c(end-2)];
    F=[b(end-1);b(end)];
    
    dx= -mldivide(Jacobiana,F);
    
    dr=dx(1);
    ds=dx(2);
end

function raices=solve_cuadratic(a,b,c)
    raices(1)= (-b+sqrt(b^2-4*a*c))/(2*a);
    
    raices(2)= (-b-sqrt(b^2-4*a*c))/(2*a);
end


function [raices, b_2]=two_roots(r,s,a,cota)    
    % resuelve 2 raices de un polinomio
    E=10*cota;                  % error inicial infinito
    while (E > cota)

        b=coeficientes(a,r,s);
        c = coeficientes(b,r,s);
        
        [dr,ds]=update(c,b);
        r=r+dr; s=s+ds;
        
        E= max(abs([ds/s, dr/r]));
    end
    raices=solve_cuadratic(1,-r,-s);
    b_2=b(1:end-2);
end

function raices = Roots(r,s,a,cota)  

    n=length(a)-1;              % grado del polinomio
    b=[];
    
    if n==1                     % caso lineal
        raices=-a(end)/a(end-1);
        
    elseif n==2                 %caso cuadratico
       
        raices =solve_cuadratic(a(1),a(2),a(3));
        
    else
        % caso de orden superior
       
        [dos_raices, b_2]=two_roots(r,s,a,cota); % encontrar 2 raices 
        raices = Roots(r,s,b_2,cota);            %recursividad
        raices= [dos_raices,raices];             % concatenar respuestas
    end
end
