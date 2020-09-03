function varargout = Kuka_Simulation(varargin)
% KUKA_SIMULATION MATLAB code for Kuka_Simulation.fig
%      KUKA_SIMULATION, by itself, creates a new KUKA_SIMULATION or raises the existing
%      singleton*.
%
%      H = KUKA_SIMULATION returns the handle to a new KUKA_SIMULATION or the handle to
%      the existing singleton*.
%
%      KUKA_SIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KUKA_SIMULATION.M with the given input arguments.
%
%      KUKA_SIMULATION('Property','Value',...) creates a new KUKA_SIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Kuka_Simulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Kuka_Simulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Kuka_Simulation

% Last Modified by GUIDE v2.5 07-May-2019 14:54:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Kuka_Simulation_OpeningFcn, ...
                   'gui_OutputFcn',  @Kuka_Simulation_OutputFcn, ...
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


% --- Executes just before Kuka_Simulation is made visible.
function Kuka_Simulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Kuka_Simulation (see VARARGIN)

% Choose default command line output for Kuka_Simulation
handles.output = hObject;
A_1 = 20;   D_1 = 345;  AL_1 = pi/2;
A_2 = 260;  D_2 = 0;    AL_2 = 0;
A_3 = 20;   D_3 = 0;    AL_3 = pi/2;
A_4 = 0;    D_4 = 260;  AL_4 = -pi/2;
A_5 = 0;    D_5 = 0;    AL_5 = pi/2;
A_6 = 0;    D_6 = 75;   AL_6 = 0;


L (1) = Link([0     D_1     A_1     AL_1]);
L (2) = Link([0     D_2     A_2     AL_2]);
L (3) = Link([0     D_3     A_3     AL_3]);
L (4) = Link([0     D_4     A_4     AL_4]);
L (5) = Link([0     D_5     A_5     AL_5]);
L (6) = Link([0     D_6     A_6     AL_6]);


Robot = SerialLink(L)
Robot.name = 'Kuka_KR3';


J = Robot.fkine([pi/2 pi/2 pi/2 pi/2 pi/2 pi/2]);


handles.CurrentT1 = pi/2;
handles.CurrentT2 = pi/2;
handles.CurrentT3 = pi/2;
handles.CurrentT4 = pi/2;
handles.CurrentT5 = pi/2;
handles.CurrentT6 = pi/2;

%handles.Pos_X.String = num2str(floor(J(1,4)));
%handles.Pos_Y.String = num2str(floor(J(2,4)));
%handles.Pos_Z.String = num2str(floor(J(3,4)));

Robot.plot([0 0 pi/2 0 0 0]); %Third Angle with issues
view(45,30);
handles.Robot = Robot;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Kuka_Simulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Kuka_Simulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on slider movement.
function Theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Theta_4_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Theta_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Theta_5_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Theta_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Theta_6_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Theta_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Pos_X_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_X as text
%        str2double(get(hObject,'String')) returns contents of Pos_X as a double


% --- Executes during object creation, after setting all properties.
function Pos_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Y_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Y as text
%        str2double(get(hObject,'String')) returns contents of Pos_Y as a double


% --- Executes during object creation, after setting all properties.
function Pos_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Z_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Z as text
%        str2double(get(hObject,'String')) returns contents of Pos_Z as a double


% --- Executes during object creation, after setting all properties.
function Pos_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ori_1_Callback(hObject, eventdata, handles)
% hObject    handle to ori_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ori_1 as text
%        str2double(get(hObject,'String')) returns contents of ori_1 as a double


% --- Executes during object creation, after setting all properties.
function ori_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ori_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ori_2_Callback(hObject, eventdata, handles)
% hObject    handle to ori_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ori_2 as text
%        str2double(get(hObject,'String')) returns contents of ori_2 as a double


% --- Executes during object creation, after setting all properties.
function ori_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ori_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ori_3_Callback(hObject, eventdata, handles)
% hObject    handle to ori_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ori_3 as text
%        str2double(get(hObject,'String')) returns contents of ori_3 as a double


% --- Executes during object creation, after setting all properties.
function ori_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ori_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Forward_Button.
function Forward_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Forward_Button (see GCBO)
Th_1 = (handles.Theta_1.Value)*pi/180;
Th_2 = (handles.Theta_2.Value)*pi/180;
Th_3 = (handles.Theta_3.Value)*pi/180;
Th_4 = (handles.Theta_4.Value)*pi/180;
Th_5 = (handles.Theta_5.Value)*pi/180;
Th_6 = (handles.Theta_6.Value)*pi/180;
% eventdata  reserved - to be defined in a future version of MATLAB
handles.Robot.plot([Th_1 -Th_2 Th_3 -Th_4 Th_5 -Th_6]);
T = handles.Robot.fkine([Th_1 -Th_2 Th_3 -Th_4 Th_5 -Th_6])
handles.CurrentT1 = Th_1;
handles.CurrentT2 = Th_2;
handles.CurrentT3 = Th_3;
handles.CurrentT4 = Th_4;
handles.CurrentT5 = Th_5;
handles.CurrentT6 = Th_6;

% handles.Pos_X.String = num2str(floor(T(1,4)));
% handles.Pos_Y.String = num2str(floor(T(2,4)));
% handles.Pos_Z.String = num2str(floor(T(3,4)));
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in Inverse_Button.
function Inverse_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Inverse_Button (see GCBO
position_x = str2double(handles.Pos_X.String);
position_y = str2double(handles.Pos_Y.String);
position_z = str2double(handles.Pos_Z.String);
oriantation_1 = str2double(handles.ori_1.String)*pi/180;
oriantation_2 = str2double(handles.ori_2.String)*pi/180;
oriantation_3 = str2double(handles.ori_3.String)*pi/180;

%handles.output = hObject;
A_1 = 20;   D_1 = 345;  AL_1 = pi/2;
A_2 = 260;  D_2 = 0;    AL_2 = 0;
A_3 = 20;   D_3 = 0;    AL_3 = pi/2;
A_4 = 0;    D_4 = 260;  AL_4 = -pi/2;
A_5 = 0;    D_5 = 0;    AL_5 = pi/2;
A_6 = 0;    D_6 = 75;   AL_6 = 0;


L (1) = Link([0     D_1     A_1     AL_1]);
L (2) = Link([0     D_2     A_2     AL_2]);
L (3) = Link([0     D_3     A_3     AL_3]);
L (4) = Link([0     D_4     A_4     AL_4]);
L (5) = Link([0     D_5     A_5     AL_5]);
L (6) = Link([0     D_6     A_6     AL_6]);

Robot = SerialLink(L)
Robot.name = 'Kuka_KR3';

Th_1 = (handles.Theta_1.Value)*pi/180;
Th_2 = (handles.Theta_2.Value)*pi/180;
Th_3 = (handles.Theta_3.Value)*pi/180;
Th_4 = (handles.Theta_4.Value)*pi/180;
Th_5 = (handles.Theta_5.Value)*pi/180;
Th_6 = (handles.Theta_6.Value)*pi/180;
% eventdata  reserved - to be defined in a future version of MATLAB
handles.Robot.plot([Th_1 -Th_2 Th_3 -Th_4 Th_5 -Th_6]);
T = handles.Robot.fkine([Th_1 -Th_2 Th_3 -Th_4 Th_5 -Th_6])

Initial_Point = transl(100,0,0);
Final_Point = transl(position_x,position_y,position_z) * rpy2tr(oriantation_1,oriantation_2,oriantation_3,'deg')

Trj = ctraj(Initial_Point,Final_Point,50);

q1 = Robot.ikine(Trj,'Initial_Point',[0,0,0,0,0,0], 'mask',[1 1 1 0 0 0]) * 180/pi

handles.Robot.plot(q1*pi/180);

% eventdata  reserved - to be defined in a future version of 
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Converg_Helical_Traj.
function Converg_Helical_Traj_Callback(hObject, eventdata, handles)
% hObject    handle to Converg_Helical_Traj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A_1 = 20;   D_1 = 345;  AL_1 = pi/2;
A_2 = 260;  D_2 = 0;    AL_2 = 0;
A_3 = 20;   D_3 = 0;    AL_3 = pi/2;
A_4 = 0;    D_4 = 260;  AL_4 = -pi/2;
A_5 = 0;    D_5 = 0;    AL_5 = pi/2;
A_6 = 0;    D_6 = 75;   AL_6 = 0;


L (1) = Link([0     D_1     A_1     AL_1]);
L (2) = Link([0     D_2     A_2     AL_2]);
L (3) = Link([0     D_3     A_3     AL_3]);
L (4) = Link([0     D_4     A_4     AL_4]);
L (5) = Link([0     D_5     A_5     AL_5]);
L (6) = Link([0     D_6     A_6     AL_6]);


Robot = SerialLink(L)
Robot.name = 'Kuka_KR3';
qi = [0 0 0 0 0 0]
qf = [12*pi 0 pi/2 0 0 0]
J2 = Robot.fkine(qf)
t = [0:0.01:2]
q = jtraj(qi,qf,t)
Robot.plot(q)

% --- Executes on button press in Pick_And_Place.
function Pick_And_Place_Callback(hObject, eventdata, handles)
% hObject    handle to Pick_And_Place (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A_1 = 20;   D_1 = 345;  AL_1 = pi/2;
A_2 = 260;  D_2 = 0;    AL_2 = 0;
A_3 = 20;   D_3 = 0;    AL_3 = pi/2;
A_4 = 0;    D_4 = 260;  AL_4 = -pi/2;
A_5 = 0;    D_5 = 0;    AL_5 = pi/2;
A_6 = 0;    D_6 = 75;   AL_6 = 0;


L (1) = Link([0     D_1     A_1     AL_1]);
L (2) = Link([0     D_2     A_2     AL_2]);
L (3) = Link([0     D_3     A_3     AL_3]);
L (4) = Link([0     D_4     A_4     AL_4]);
L (5) = Link([0     D_5     A_5     AL_5]);
L (6) = Link([0     D_6     A_6     AL_6]);


Robot = SerialLink(L)
Robot.name = 'Kuka_KR3';
q2i = [0 0 0 0 0 0]
q2f = [0 0 pi/4 0 0 0]
q3f = [pi 0 pi/2 0 0 0]
q4f = [pi 0 0 0 0 0]
J3 = Robot.fkine(q2f)
t = [0:0.01:0.5]
qq = jtraj(q2i,q2f,t)
qq2 = jtraj(q2f,q3f,t)
qq3 = jtraj(q3f,q4f,t)
Robot.plot(qq)
hold on
Robot.plot(qq2)
Robot.plot(qq3)

