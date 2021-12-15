function varargout = mnv_1(varargin)
% MNV_1 MATLAB code for mnv_1.fig
%      MNV_1, by itself, creates a new MNV_1 or raises the existing
%      singleton*.
%
%      H = MNV_1 returns the handle to a new MNV_1 or the handle to
%      the existing singleton*.
%
%      MNV_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MNV_1.M with the given input arguments.
%
%      MNV_1('Property','Value',...) creates a new MNV_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mnv_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mnv_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mnv_1

% Last Modified by GUIDE v2.5 15-Dec-2021 11:03:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mnv_1_OpeningFcn, ...
                   'gui_OutputFcn',  @mnv_1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mnv_1 is made visible.
function mnv_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mnv_1 (see VARARGIN)

% Choose default command line output for mnv_1
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

set(handles.SecXo,'Enable','off');
set(handles.SecX1,'Enable','off');
set(handles.NewRXo,'Enable','off');
set(handles.puntFXo,'Enable','off');
set(handles.PuntoFGx,'Enable','off');
set(handles.cerradoA,'Enable','off');
set(handles.cerradoB,'Enable','off');
set(handles.mullx0,'Enable','off');
set(handles.mullx1,'Enable','off');
set(handles.mullx2,'Enable','off');
set(handles.matrix1,'Enable','off');
set(handles.vector,'Enable','off');
set(handles.seidelLamb,'Enable','off');
set(handles.equis,'Enable','off');


% UIWAIT makes mnv_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
    

% --- Outputs from this function are returned to the command line.
function varargout = mnv_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ecuationText_Callback(hObject, eventdata, handles)
% hObject    handle to ecuationText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ecuationText as text
%        str2double(get(hObject,'String')) returns contents of ecuationText as a double


% --- Executes during object creation, after setting all properties.
function ecuationText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ecuationText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in graficarButton.
function graficarButton_Callback(hObject, eventdata, handles)
syms x;
func = get(handles.ecuationText,'String');
zoom(handles.axes1,'on');
set(handles.axes1,'xcolor','r','ycolor','b');
ezplot(handles.axes1,func,[-180,420]);
grid on;


% --- Executes on button press in checkBiseccion.
function checkBiseccion_Callback(hObject, eventdata, handles)
value = get(handles.checkBiseccion,'Value');
if value == 1
    set(handles.cerradoA,'Enable','on');
    set(handles.cerradoB,'Enable','on');
else
    set(handles.cerradoA,'Enable','off');
    set(handles.cerradoB,'Enable','off');
end


% --- Executes on button press in checkPuntoF.
function checkPuntoF_Callback(hObject, eventdata, handles)
value = get(handles.checkPuntoF,'Value');
if value == 1
    set(handles.puntFXo,'Enable','on');
    set(handles.PuntoFGx,'Enable','on');
else
    set(handles.puntFXo,'Enable','off');
    set(handles.PuntoFGx,'Enable','off');
end


% --- Executes on button press in checkNR.
function checkNR_Callback(hObject, eventdata, handles)
value = get(handles.checkNR, 'Value');
if( value == 1 )
    set(handles.NewRXo,'Enable','on');
else
    set(handles.NewRXo,'Enable','off');
end


% --- Executes on button press in checkSecante.
function checkSecante_Callback(hObject, eventdata, handles)
value = get(handles.checkSecante,'Value');
if( value == 1)
    set(handles.SecXo,'Enable','on');
    set(handles.SecX1,'Enable','on');
else
    set(handles.SecXo,'Enable','off');
    set(handles.SecX1,'Enable','off');
end




function cerradoA_Callback(hObject, eventdata, handles)
% hObject    handle to cerradoA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cerradoA as text
%        str2double(get(hObject,'String')) returns contents of cerradoA as a double


% --- Executes during object creation, after setting all properties.
function cerradoA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cerradoA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cerradoB_Callback(hObject, eventdata, handles)
% hObject    handle to cerradoB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cerradoB as text
%        str2double(get(hObject,'String')) returns contents of cerradoB as a double


% --- Executes during object creation, after setting all properties.
function cerradoB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cerradoB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function puntFXo_Callback(hObject, eventdata, handles)
% hObject    handle to puntFXo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puntFXo as text
%        str2double(get(hObject,'String')) returns contents of puntFXo as a double


% --- Executes during object creation, after setting all properties.
function puntFXo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puntFXo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PuntoFGx_Callback(hObject, eventdata, handles)
% hObject    handle to PuntoFGx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PuntoFGx as text
%        str2double(get(hObject,'String')) returns contents of PuntoFGx as a double


% --- Executes during object creation, after setting all properties.
function PuntoFGx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PuntoFGx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NewRXo_Callback(hObject, eventdata, handles)
% hObject    handle to NewRXo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NewRXo as text
%        str2double(get(hObject,'String')) returns contents of NewRXo as a double


% --- Executes during object creation, after setting all properties.
function NewRXo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NewRXo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SecXo_Callback(hObject, eventdata, handles)
% hObject    handle to SecXo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SecXo as text
%        str2double(get(hObject,'String')) returns contents of SecXo as a double


% --- Executes during object creation, after setting all properties.
function SecXo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecXo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SecX1_Callback(hObject, eventdata, handles)
% hObject    handle to SecX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SecX1 as text
%        str2double(get(hObject,'String')) returns contents of SecX1 as a double


% --- Executes during object creation, after setting all properties.
function SecX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resolverButton.
function resolverButton_Callback(hObject, eventdata, handles)
% hObject    handle to resolverButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
secantValue = get(handles.checkSecante,'value');
newtonRaphsonValue = get(handles.checkNR,'value');
biseccionValue = get(handles.checkBiseccion,'value');
puntoFijoValue = get(handles.checkPuntoF,'value');
mullerValue = get(handles.checkMuller,'value');


functionValue = get(handles.ecuationText, 'String');
error = get(handles.errorText,'String');
error = str2double(error);
iteraciones = get(handles.iteracionesText,'String');
iteraciones = str2double(iteraciones);
%f = 'exp(-x^2)-x'; Por ahora comentado.
f = functionValue;
%x0 = 0;
%er = 0.001;
% Si el checkbox de la secante esta presionado ingresa.
if( secantValue == 1 )
    xo = get(handles.SecXo,'String');
    x1 = get(handles.SecX1,'String');
    xo = str2double(xo);
    x1 = str2double(x1);
    secant_method(f,xo,x1,error,iteraciones);
end

% Si el checkbox de newton raphson.
if newtonRaphsonValue == 1
    xo = get(handles.NewRXo,'String');
    xo = str2double(xo);
    newton_raphson(f,xo,iteraciones,error);
end

if biseccionValue == 1
    a = get(handles.cerradoA,'String');
    b = get(handles.cerradoB,'String');
    a = str2double(a);
    b = str2double(b);
    bisec_m(error,iteraciones,f,a,b);
end

if puntoFijoValue == 1
    xo = get(handles.puntFXo,'String');
    g = get(handles.PuntoFGx,'String');
    xo = str2double(xo);
    punto_fijo(f,g,xo,error,iteraciones);
end

if mullerValue == 1
    xo = get(handles.mullx0,'String');
    x1 = get(handles.mullx1,'String');
    x2 = get(handles.mullx2,'String');
    xo = str2double(xo);
    x1 = str2double(x1);
    x2 = str2double(x2);
    Muller(f,xo,x1,x2,error);
end




function errorText_Callback(hObject, eventdata, handles)
% hObject    handle to errorText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of errorText as text
%        str2double(get(hObject,'String')) returns contents of errorText as a double


% --- Executes during object creation, after setting all properties.
function errorText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to errorText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iteracionesText_Callback(hObject, eventdata, handles)
% hObject    handle to iteracionesText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iteracionesText as text
%        str2double(get(hObject,'String')) returns contents of iteracionesText as a double


% --- Executes during object creation, after setting all properties.
function iteracionesText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteracionesText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkJacobi.
function checkJacobi_Callback(hObject, eventdata, handles)
% hObject    handle to checkJacobi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkJacobi
value = get(handles.checkJacobi,'Value');
if(value == 1)
    set(handles.matrix1,'Enable','on');
    set(handles.vector,'Enable','on');
    set(handles.equis,'enable','on');
else
    set(handles.matrix1,'Enable','off');
    set(handles.vector,'Enable','off');
    set(handles.equis,'Enable','off');
end




% --- Executes on button press in checkSeidel.
function checkSeidel_Callback(hObject, eventdata, handles)
% hObject    handle to checkSeidel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkSeidel
value = get(handles.checkSeidel,'Value');
if(value == 1)
    set(handles.matrix1,'Enable','on');
    set(handles.vector,'Enable','on');
    set(handles.seidelLamb,'Enable','on');
    set(handles.equis,'Enable','on');
else
    set(handles.matrix1,'Enable','off');
    set(handles.vector,'Enable','off');
    set(handles.seidelLamb,'Enable','off');
    set(handles.equis,'Enable','off');
end

% --- Executes on button press in checkGauss.
function checkGauss_Callback(hObject, eventdata, handles)
% hObject    handle to checkGauss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkGauss
value = get(handles.checkGauss,'Value');
if(value == 1)
    set(handles.matrix1,'Enable','on');
    set(handles.vector,'Enable','on');
else
    set(handles.matrix1,'Enable','off');
    set(handles.vector,'Enable','off');
end

function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pushbutton7 as text
%        str2double(get(hObject,'String')) returns contents of pushbutton7 as a double



function matrix1_Callback(hObject, eventdata, handles)
% hObject    handle to matrix1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrix1 as text
%        str2double(get(hObject,'String')) returns contents of matrix1 as a double


% --- Executes during object creation, after setting all properties.
function matrix1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrix1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    set(hObject,'Max',3000);
end



function vector_Callback(hObject, eventdata, handles)
% hObject    handle to vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vector as text
%        str2double(get(hObject,'String')) returns contents of vector as a double


% --- Executes during object creation, after setting all properties.
function vector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkMuller.
function checkMuller_Callback(hObject, eventdata, handles)
% hObject    handle to checkMuller (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkMuller
value = get(handles.checkMuller,'Value');
if( value == 1 )
    set(handles.mullx0,'Enable','on');
    set(handles.mullx1,'Enable','on');
    set(handles.mullx2,'Enable','on');
else
    set(handles.mullx0,'Enable','off');
    set(handles.mullx1,'Enable','off');
    set(handles.mullx2,'Enable','off');
end


function mullx0_Callback(hObject, eventdata, handles)
% hObject    handle to mullx0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mullx0 as text
%        str2double(get(hObject,'String')) returns contents of mullx0 as a double


% --- Executes during object creation, after setting all properties.
function mullx0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mullx0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to mullx0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mullx0 as text
%        str2double(get(hObject,'String')) returns contents of mullx0 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mullx0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mullx2_Callback(hObject, eventdata, handles)
% hObject    handle to mullx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mullx2 as text
%        str2double(get(hObject,'String')) returns contents of mullx2 as a double


% --- Executes during object creation, after setting all properties.
function mullx2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mullx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in enviarButton.
function enviarButton_Callback(hObject, eventdata, handles)
% hObject    handle to enviarButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valueJacobi = get(handles.checkJacobi,'value');
valueSeidel = get(handles.checkSeidel,'value');
valueGauss = get(handles.checkGauss,'value');

matrix = get(handles.matrix1,'String');
vector = get(handles.vector,'String');
matrix = str2num(matrix);
vector = str2num(vector);
vector = vector';

if valueJacobi == 1
    in = get(handles.equis,'string');
    iter = get(handles.iteracionesText,'String');
    err = get(handles.errorText,'string');
    iter = str2num(iter);
    err = str2num(err);
    in = str2num(in);
    Jacobi(matrix,vector,in,[],err);
end

if valueGauss == 1
    GaussJordan(matrix,vector);
end

if valueSeidel == 1
    
    in = get(handles.equis,'string');
    iter = get(handles.iteracionesText,'string');
    err = get(handles.errorText,'string');
    lam = get(handles.seidelLamb,'string');
    iter = str2num(iter);
    err = str2num(err);
    in = str2num(in);
    lam = str2num(lam);
    GaussSeidel(matrix,vector,in,[],err,lam);
end

function mullx1_Callback(hObject, eventdata, handles)
% hObject    handle to mullx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mullx1 as text
%        str2double(get(hObject,'String')) returns contents of mullx1 as a double


% --- Executes during object creation, after setting all properties.
function mullx1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mullx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function seidelLamb_Callback(hObject, eventdata, handles)
% hObject    handle to seidelLamb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seidelLamb as text
%        str2double(get(hObject,'String')) returns contents of seidelLamb as a double


% --- Executes during object creation, after setting all properties.
function seidelLamb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seidelLamb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function equis_Callback(hObject, eventdata, handles)
% hObject    handle to equis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of equis as text
%        str2double(get(hObject,'String')) returns contents of equis as a double


% --- Executes during object creation, after setting all properties.
function equis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in curvaButton.
function curvaButton_Callback(hObject, eventdata, handles)
% hObject    handle to curvaButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ajuste_inter;
