function varargout = finalp(varargin)
%FINALP MATLAB code file for finalp.fig
%      FINALP, by itself, creates a new FINALP or raises the existing
%      singleton*.
%
%      H = FINALP returns the handle to a new FINALP or the handle to
%      the existing singleton*.
%
%      FINALP('Property','Value',...) creates a new FINALP using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to finalp_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      FINALP('CALLBACK') and FINALP('CALLBACK',hObject,...) call the
%      local function named CALLBACK in FINALP.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help finalp

% Last Modified by GUIDE v2.5 27-Sep-2023 11:03:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finalp_OpeningFcn, ...
                   'gui_OutputFcn',  @finalp_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before finalp is made visible.
function finalp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for finalp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes finalp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = finalp_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i = uigetfile(".jpg;.png");
i = imread(i);
axes(handles.axes1);
imshow(i);
setappdata(0,'i',i)

xrayImage = rgb2gray(i);
% Perform edge detection
edgeImage = edge(xrayImage, 'Canny'); % You can use other edge detection methods as well
% Perform Hough Transform to detect lines
axes(handles.axes3);
imshow(edgeImage);
setappdata(0,'i',i)
[H, theta, rho] = hough(edgeImage);
% Find peaks in the Hough transform
peaks = houghpeaks(H, 2); % You may need to adjust the number of peaks to detect
% Check if there are major angle contributions (fractures)
if size(peaks, 1) > 1
    fprintf('Fracture detected\n');
else
    fprintf('No fracture detected\n');
end
% Optionally, visualize the detected lines (peaks) on the original image
axes(handles.axes2);
imshow(xrayImage);
setappdata(0,'i',i)
hold on;
lines = houghlines(edgeImage, theta, rho, peaks);
for i = 1:length(lines)
    xy = [lines(i).point1; lines(i).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'r');
end
hold off;
% Update the text box (text2) based on the detection result
outputMessage = '....';
if size(peaks, 1) > 1
    outputMessage = 'Fracture detected';
else
    outputMessage = 'No fracture detected';
end

% Update the textbox with the output message
set(handles.text2, 'String', outputMessage);

% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Initialize the output message
outputMessage = '';
