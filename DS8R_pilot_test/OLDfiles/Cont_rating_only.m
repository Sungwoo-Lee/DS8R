%% continuous rating

global theWindow W H window_ratio  %window property
global lb rb scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color

screens = Screen('Screens');
window_num = screens(1);
Screen('Preference', 'SkipSyncTests', 0);
screen_mode = 'testmode';
window_ratio = 1.11;
window_info = Screen('Resolution', window_num);
switch screen_mode
    case 'full'
        window_rect = [0 0 window_info.width window_info.height]; % full screen
        fontsize = 32;
    case 'semifull'
        window_rect = [0 0 window_info.width-100 window_info.height-100]; % a little bit distance
    case 'middle'
        window_rect = [0 0 window_info.width/2 window_info.height/2];
    case 'small'
        window_rect = [0 0 1200 720]; % in the test mode, use a little smaller screen
        fontsize = 10;
    case 'test'
        window_rect = [0 0 window_info.width window_info.height]/window_ratio;
        fontsize = 20;
    case 'testmode'
        window_rect = [0 0 1240 800];
        fontsize = 26;
end

% color
bgcolor = 50;
white = 255;
red = [158 1 66];
orange = [255 164 0];

% size
W = window_rect(3); % width
H = window_rect(4); % height

lb = W*(1/6); % rating scale left bounds 1/4
rb = W*(5/6); % rating scale right bounds 3/4

scale_W = (rb-lb)*0.1;
scale_H = H*0.1;

anchor_lms = [W/2-0.014*(W/2-lb) W/2-0.061*(W/2-lb) W/2-0.172*(W/2-lb) W/2-0.354*(W/2-lb) W/2-0.533*(W/2-lb);
    W/2+0.014*(W/2-lb) W/2+0.061*(W/2-lb) W/2+0.172*(W/2-lb) W/2+0.354*(W/2-lb) W/2+0.533*(W/2-lb)];
%W/2-lb = rb-W/2

% start the screen
theWindow = Screen('OpenWindow', window_num, bgcolor, window_rect);

% font
%font = 'Helvetica';
font = 'NanumBarunGothic';
Screen('Preference', 'TextEncodingLocale', 'ko_KR.UTF-8');

%Screen('TextFont', theWindow, font);
Screen('TextSize', theWindow, fontsize);

%Start
x = W/2; %center
y = H*(1/2);
SetMouse(x,y);
HideCursor;

while true
    [x,~,~] = GetMouse(theWindow);
    if x < lb
        x = lb;
    elseif x > rb
        x = rb;
    end
    
    Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); %rating scale
    % penWidth: 0.125~7.000
    msgtxt = '이 경험이 얼마나 유쾌 혹은 불쾌한지를 지속적으로 보고해주세요.';
    DrawFormattedText(theWindow, double(msgtxt), 'center', H*(1/4), orange);
    Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
    DrawFormattedText(theWindow, double('불쾌'), lb-scale_H/2.8, H*(1/2)+scale_H, white);
    Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
    DrawFormattedText(theWindow, double('유쾌'), rb-scale_H/2.8, H*(1/2)+scale_H, white);
    Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
    Screen('DrawLine', theWindow, orange, x, H*(1/2)-scale_H/2, x, H*(1/2)+scale_H/2, 6); %rating bar
    Screen('Flip', theWindow);
    
    [~,~,keyCode] = KbCheck;
    if keyCode(KbName('space')) == 1
        break
    end
    
end

sca;
Screen('CloseAll');

