function DS8R_pilot_setscreen(screen_mode)
    global W H window_ratio window_num window_rect theWindow fontsize font %window property
    global lb1 rb1 lb2 rb2 scale_W scale_H anchor_lms  %rating scale
    global bgcolor white orange red  %color        

    bgcolor = 50;
    % window_ratio = 3;
    
    screens = Screen('Screens');
    window_num = screens(1);
    Screen('Preference', 'SkipSyncTests', 1);
    window_info = Screen('Resolution', window_num);
    
    switch screen_mode
        case 'Full'
            window_rect = [0 0 window_info.width window_info.height]; % full screen
            fontsize = 32;
        case 'Semifull'
            window_rect = [0 0 window_info.width-100 window_info.height-100]; % a little bit distance
        case 'Middle'
            window_rect = [0 0 window_info.width/2 window_info.height/2];
        case 'Small'
            window_rect = [0 0 400 300]; % in the test mode, use a little smaller screen
            fontsize = 10;
        case 'Test'
            window_rect = [0 0 window_info.width window_info.height]/window_ratio;
            fontsize = 20;
        case 'Testmode'
            window_rect = [0 0 1440 900];  % 1920 1080]; full screen for window
            fontsize = 32;
    end
    
    % size
    W = window_rect(3); % width
    H = window_rect(4); % height
    
    lb1 = W*(1/6); % rating scale left bounds 1/6
    rb1 = W*(5/6); % rating scale right bounds 5/6
    lb2 = W*(1/4); % rating scale left bounds 1/4
    rb2 = W*(3/4); % rating scale right bounds 3/4
    
    scale_W = W*0.1;
    scale_H = H*0.1;
    
    anchor_lms = [W/2-0.014*(W/2-lb1) W/2-0.061*(W/2-lb1) W/2-0.172*(W/2-lb1) W/2-0.354*(W/2-lb1) W/2-0.533*(W/2-lb1);
        W/2+0.014*(W/2-lb1) W/2+0.061*(W/2-lb1) W/2+0.172*(W/2-lb1) W/2+0.354*(W/2-lb1) W/2+0.533*(W/2-lb1)];
    %W/2-lb1 = rb1-W/2
    
    % color
    white = 255;
    red = [158 1 66];
    orange = [255 164 0];
    
    % font
    font = 'NanumBarunGothic';
    Screen('Preference', 'TextEncodingLocale', 'ko_KR.UTF-8');
    
    theWindow = Screen('OpenWindow', window_num, bgcolor, window_rect); % start the screen
    % Screen('TextFont', theWindow, font);
    Screen('TextSize', theWindow, fontsize);
    
    Screen(theWindow, 'FillRect', bgcolor, window_rect);
    Screen('Flip', theWindow);
    HideCursor;
end