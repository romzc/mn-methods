function [F]=Muller(f,x0,x1,x2,e )
%f=input('Introduzca la funcion: ');
%x0=input('Inserte x0: ');
%x1=input('Inserte x1: ');
%x2=input('Inserte x2: ');
%e=input('Inserte ea: ');
%-----------------------------------------------------%
fx=inline(f);
%-----------------------------------------------------%
k=0;
xi=0;
sigue=1;

%-----------------------------------------------------%

figu = figure;
set(figu,'MenuBar', 'none');
set(figu,'ToolBar','none');

row = 1:100;
column = {'x0','x1','x2','xr','ea' };

data = {0,0,0,0,0};


%-----------------------------------------------------%
while(sigue)
    xi=x2;
    k=k+1;
    %fprintf('\nIteraccion: ');
    %fprintf('%f',k);
    
    h0=x1-x0;
    h1=x2-x1;
    d0=(fx(x1)-fx(x0))/h0;
    d1=(fx(x2)-fx(x1))/h1;
    a=(d1-d0)/(h1+h0);
    b=a*h1+d1;
    c=fx(x2);
    
    raizd=sqrt(b*b-4*a*c);
    %-----------------------------------------------------%
    if abs (b+raizd)> abs(b-raizd)
        den=b+raizd;
    else
        den=b-raizd;
    end
    %-----------------------------------------------------%
    
    dxr=-2*c/den;
    xr=x2+dxr;
    sigue=abs(dxr)/xr>e || k<c || abs(fx(xr))>e;
    et=abs(xr-x2)/xr;
    ea=et*100;
    
     %-----------------------------------------------------%
     
     if(k == 1)
         data = {x0,x1,x2,xr,ea};
     else
        newData = {x0,x1,x2,xr,ea};
        newMatrix = [data;newData];
        data = newMatrix;
     end
     
     %fprintf('\nx0: ');
     %fprintf('%f',x0);

     %fprintf('\nx1: ');
     %fprintf('%f',x1);

     %fprintf('\nx2: ');
     %fprintf('%f',x2);
     
     %fprintf('\nxr: ');
     %fprintf('%f',xr);
     
     %fprintf('\nea: ');
     %fprintf('%f',ea);
     
     %fprintf('\n');

    x0=x1;
    x1=x2;
    x2=xr;
end

tab = uitable('columnname',column, ...
              'rowname',row, ...
              'data',data, ...
              'position',[0 0 600 400]);

