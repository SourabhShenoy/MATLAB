function varargout = Image_Filter(varargin)
% IMAGE_FILTER MATLAB code for Image_Filter.fig
%      IMAGE_FILTER, by itself, creates a new IMAGE_FILTER or raises the existing
%      singleton*.
%
%      H = IMAGE_FILTER returns the handle to a new IMAGE_FILTER or the handle to
%      the existing singleton*.
%
%      IMAGE_FILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_FILTER.M with the given input arguments.
%
%      IMAGE_FILTER('Property','Value',...) creates a new IMAGE_FILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Image_Filter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Image_Filter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Image_Filter

% Last Modified by GUIDE v2.5 28-Sep-2014 17:58:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Image_Filter_OpeningFcn, ...
                   'gui_OutputFcn',  @Image_Filter_OutputFcn, ...
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


% --- Executes just before Image_Filter is made visible.
function Image_Filter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Image_Filter (see VARARGIN)

% Choose default command line output for Image_Filter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

Filter_1 = imread ('BW_Filter1.jpg');
axes (handles.Filter1);
handles.Fil1 = Filter_1;
imshow(Filter_1);

Filter_2 = imread ('BW_Filter2.jpg');
axes (handles.Filter2);
handles.Fil2 = Filter_2;
imshow(Filter_2);

Filter_3 = imread ('BW_Filter3.jpg');
axes (handles.Filter3);
handles.Fil3 = Filter_3;
imshow(Filter_3);

Filter_4 = imread ('BW_Filter4.jpg');
axes (handles.Filter4);
handles.Fil4 = Filter_4;
imshow(Filter_4);

guidata(hObject, handles);

% UIWAIT makes Image_Filter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Image_Filter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Browse_Image.
function Browse_Image_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[ipfilename] = uigetfile ('*.*', 'Choose an input Image');
axes (handles.IPimage);
ip_image = imread(ipfilename);
imshow (ip_image);
handles.ipimg = ip_image;
guidata(hObject, handles);

% --- Executes on button press in Apply_Filter.
function Apply_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Apply_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

guidata(hObject, handles);
ip = handles.ipimg;
switch (handles.Filter_Val)
    case 1
        fil = handles.Fil1;
    case 2
        fil = handles.Fil2;
    case 3
        fil = handles.Fil3;
    case 4
        fil = handles.Fil4;
    otherwise
        disp (' No Filter Selected ');
end

op = histMatch (ip, fil);
axes (handles.OPimage);
imshow (op);

% --- Executes on selection change in Filter_List.
function Filter_List_Callback(hObject, eventdata, handles)
% hObject    handle to Filter_List (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Filter_List contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Filter_List

handles.Filter_Val = get(hObject,'Value');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Filter_List_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Filter_List (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 a = questdlg('Are You Sure??', ...
                         'Confirmation', ...
                         'Yes', 'No', 'Default');
                     
   switch a,
     case 'No',
     %
     case 'Yes',
    close all;
     case 'Default',
       %
   end 
