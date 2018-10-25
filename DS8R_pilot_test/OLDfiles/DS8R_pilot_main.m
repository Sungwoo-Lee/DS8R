classdef DS8R_pilot_main < handle
    %% SETUP : Basic parameters
    properties (SetAccess = public)
        theWindow, W, H, window_ratio  %window property
        lb1, rb1, lb2, rb2, scale_W, scale_H, anchor_lms  %rating scale
        bgcolor, white, orange, red  %color
        SID, SubjNum, SubjRun, rating_types_pls, run_dur, changecolor, changetime
        type = {'TOUCH', 'SWEET', 'QUIN', ' CAPS', 'REST'};
        run_i = 1;
        
        explain = false;
        practice = false;
        run = false;
        USE_EYELINK = false;
        USE_BIOPAC = false;
        
        basedir = pwd;
        % savedir = fullfile(pwd, 'data');
    end
    
    %% Define methos
    methods
        
       %% PARSING VARARGIN
        function init(obj, varargin)
            cd(obj.basedir);
            addpath(genpath(obj.basedir));
            
            for i = 1:length(varargin)
                if ischar(varargin{i})
                    switch varargin{i}
                        % functional commands
                        case {'explain'}
                            obj.explain = true;
                        case {'practice'}
                            obj.practice = true;
                        case {'run'}
                            obj.run = true;
                            %             case {'savedir'}
                            %                 savedir = varargin{i+1};
                        case {'eyelink'}
                            obj.USE_EYELINK = true;
                        case {'biopac'}
                            obj.USE_BIOPAC = true;
                            channel_n = 3;
                            biopac_channel = 0;
                            ljHandle = BIOPAC_setup(channel_n); % BIOPAC SETUP
                    end
                end
            end
        end
        
        
        
        
        %% SETUP : Save data according to subject information
        function save_data(obj,subID, subNum, subRun)
            
            obj.SID = subID;
            obj.SubjNum = subNum;
            obj.SubjRun = subRun;
            
            savedir = fullfile(obj.basedir, 'Data');
            
            nowtime = clock;
            SubjDate = sprintf('%.2d%.2d%.2d', nowtime(1), nowtime(2), nowtime(3));
            
            data.subject = obj.SID;
            data.datafile = fullfile(savedir, [SubjDate, '_', obj.SID, '_PLS', sprintf('%.3d', obj.SubjNum), ...
                '_run', sprintf('%.2d', obj.SubjRun), '.mat']);
            data.version = 'Pleasure_v1_10-04-2018_Cocoanlab';  % month-date-year
            data.starttime = datestr(clock, 0);
            data.starttime_getsecs = GetSecs;
            
            % if the same file exists, break and retype subject info
            if exist(data.datafile, 'file')
                fprintf('\n ** EXSITING FILE: %s %s **', data.subject, SubjDate);
                cont_or_not = input(['\nYou typed the run number that is inconsistent with the data previously saved.', ...
                    '\nWill you go on with your run number that typed just before?', ...
                    '\n1: Yes, continue with typed run number.  ,   2: No, it`s a mistake. I`ll break.\n:  ']);
                if cont_or_not == 2
                    error('Breaked.')
                elseif cont_or_not == 1
                    save(data.datafile, 'data');
                end
            else
                save(data.datafile, 'data');
            end
        end
            
        
        
        
        
        
        %% SETUP : Create paradigm according to subject information
        function save_padam(obj)
            S.type = obj.type;
            % run_dur = 18*60; % including disdaq, except 8 secs before trigger
            obj.run_dur = 20;  %
            
            obj.changecolor = [10:60:obj.run_dur];          
            changecolor_jitter = randi(10, 1, numel(obj.changecolor));
            obj.changecolor = obj.changecolor + changecolor_jitter;
            obj.changetime = 1; % duration of color change : 1 sec
            
            obj.rating_types_pls = call_ratingtypes_pls;
            
            data.dat.type = S.type;
            data.dat.duration = obj.run_dur;
            data.dat.changecolor = obj.changecolor;
            data.dat.changetime = obj.changetime;
            
        end

        
        
        
        
        
        
        %% SETUP : Screen
        function screen_set(obj)

            obj.bgcolor = 50;
            obj.window_ratio = 3;
            
            screens = Screen('Screens');
            window_num = screens(1);
            Screen('Preference', 'SkipSyncTests', 1);
            screen_mode = 'testmode';
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
                    window_rect = [0 0 400 300]; % in the test mode, use a little smaller screen
                    fontsize = 10;
                case 'test'
                    window_rect = [0 0 window_info.width window_info.height]/obj.window_ratio;
                    fontsize = 20;
                case 'testmode'
                    window_rect = [0 0 1440 900];  % 1920 1080]; full screen for window
                    fontsize = 32;
            end
            
            % size
            obj.W = window_rect(3); % width
            obj.H = window_rect(4); % height
            
            
            obj.lb1 = obj.W*(1/6); % rating scale left bounds 1/6
            obj.rb1 = obj.W*(5/6); % rating scale right bounds 5/6
            obj.lb2 = obj.W*(1/4); % rating scale left bounds 1/4
            obj.rb2 = obj.W*(3/4); % rating scale right bounds 3/4
            
            obj.scale_W = obj.W*0.1;
            obj.scale_H = obj.H*0.1;
            
            obj.anchor_lms = [obj.W/2-0.014*(obj.W/2-obj.lb1) obj.W/2-0.061*(obj.W/2-obj.lb1) obj.W/2-0.172*(obj.W/2-obj.lb1) obj.W/2-0.354*(obj.W/2-obj.lb1) obj.W/2-0.533*(obj.W/2-obj.lb1);
                obj.W/2+0.014*(obj.W/2-obj.lb1) obj.W/2+0.061*(obj.W/2-obj.lb1) obj.W/2+0.172*(obj.W/2-obj.lb1) obj.W/2+0.354*(obj.W/2-obj.lb1) obj.W/2+0.533*(obj.W/2-obj.lb1)];
            %W/2-lb1 = rb1-W/2
            
            % color
            obj.white = 255;
            obj.red = [158 1 66];
            obj.orange = [255 164 0];
            
            % font
            % font = 'NanumBarunGothic';
            Screen('Preference', 'TextEncodingLocale', 'ko_KR.UTF-8');
            
           %% Start : Screen
            obj.theWindow = Screen('OpenWindow', window_num, obj.bgcolor, window_rect); % start the screen
            % Screen('TextFont', theWindow, font);
            Screen('TextSize', obj.theWindow, fontsize);
            
            Screen(obj.theWindow, 'FillRect', obj.bgcolor, window_rect);
            Screen('Flip', obj.theWindow);
            HideCursor;

        end

        
        
        
        
        %% SETUP: Save eyelink filename according to subject information
        function eye_link(obj)
            
            % need to be revised when the eyelink is here.
            if obj.USE_EYELINK
                
                edf_filename = ['E_' obj.SID '_' obj.SubjNum]; % name should be equal or less than 8
                edfFile = sprintf('%s.EDF', edf_filename);
                eyelink_main(edfFile, 'Init');
                
                status = Eyelink('Initialize');
                if status
                    error('Eyelink is not communicating with PC. It is okay though.');
                end
                Eyelink('Command', 'set_idle_mode');
                waitsec_fromstarttime(GetSecs, .5);
                
            end
        end
        
        
        
        
        
        %% Start Run
        function run_experiment(obj)
            
            
           theWindow = obj.theWindow;
           W = obj.W;
           H = obj.H;
           window_ratio = obj.window_ratio;
           lb1 = obj.lb1, 
           rb1 = obj.rb1;
           lb2 = obj.lb2;
           rb2 = obj.rb2;
           scale_W = obj.scale_W;
           scale_H = obj.scale_W;
           anchor_lms = obj.anchor_lms;
           bgcolor = obj.bgcolor; 
           white = obj.white; 
           orange = obj.orange;
           red = obj.red;
           SID = obj.SID;
           SubjNum = obj.SubjNum;
           SubjRun = obj.SubjRun;
           rating_types_pls = obj.rating_types_pls;
           run_dur = obj.run_dur;
           changecolor = obj.changecolor; 
           changetime = obj.changetime;
           
           explain = obj.explain;
           practice = obj.practice;
           run = obj.run;
           USE_EYELINK = obj.USE_EYELINK;
           USE_BIOPAC = obj.USE_BIOPAC;
           
           basedir = obj.basedir;
           
           
           %% SETUP : Screen
           
           bgcolor = 50;
%            window_ratio = 3;
           
           screens = Screen('Screens');
           window_num = screens(1);
           Screen('Preference', 'SkipSyncTests', 1);
           screen_mode = 'testmode';
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
                   window_rect = [0 0 400 300]; % in the test mode, use a little smaller screen
                   fontsize = 10;
               case 'test'
                   window_rect = [0 0 window_info.width window_info.height]/window_ratio;
                   fontsize = 20;
               case 'testmode'
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
           % font = 'NanumBarunGothic';
           Screen('Preference', 'TextEncodingLocale', 'ko_KR.UTF-8');
           
           %% Start : Screen
           
           theWindow = Screen('OpenWindow', window_num, bgcolor, window_rect); % start the screen
           % Screen('TextFont', theWindow, font);
           Screen('TextSize', theWindow, fontsize);
           
           Screen(theWindow, 'FillRect', bgcolor, window_rect);
           Screen('Flip', theWindow);
           HideCursor;
           
            try
                %% (Explain) Continuous & Overall
                
%                 if explain
%                     
%                     % Explain bi-directional scale with visualization
%                     while true % Button
%                         msgtxt = '지금부터 실험이 시작됩니다. 먼저, 실험을 진행하기에 앞서 평가 척도에 대한 설명을 진행하겠습니다.\n\n참가자는 모든 준비가 완료되면 버튼을 눌러주시기 바랍니다.';
%                         DrawFormattedText(theWindow, double(msgtxt), 'center', 'center', white, [], [], [], 2);
%                         Screen('Flip', theWindow);
%                         
%                         [~,~,button] = GetMouse(theWindow);
%                         if button(1) == 1
%                             break
%                         end
%                     end
%                     
%                     while true % Space
%                         Screen(theWindow, 'FillRect', bgcolor, window_rect);
%                         cont_rat_scale = imread('gLMS_bidirectional_rating_scale','jpg');
%                         [s1, s2, s3] = size(cont_rat_scale);
%                         cont_rat_scale_texture = Screen('MakeTexture', theWindow, cont_rat_scale);
%                         Screen('DrawTexture', theWindow, cont_rat_scale_texture, [0 0 s2 s1],[0 0 W H]);  %show the continuous rating scale
%                         Screen('Flip', theWindow);
%                         
%                         [~,~,keyCode] = KbCheck;
%                         if keyCode(KbName('space')) == 1
%                             break
%                         elseif keyCode(KbName('q')) == 1
%                             abort_experiment('manual');
%                             break
%                         end
%                     end
%                     
%                     
%                     % go to the next after space is unpressed
%                     while keyCode(KbName('space')) == 1
%                         if keyCode(KbName('space')) == 1
%                             while keyCode(KbName('space')) == 1
%                                 [~,~,keyCode] = KbCheck;
%                             end
%                             break
%                         end
%                     end
%                     
%                     
%                     
%                     % Explain one-directional scale with visualization
%                     while true % Space
%                         Screen(theWindow, 'FillRect', bgcolor, window_rect);
%                         overall_rat_scale = imread('gLMS_unidirectional_rating_scale','jpg');
%                         [s1, s2, s3] = size(overall_rat_scale);
%                         overall_rat_scale_texture = Screen('MakeTexture', theWindow, overall_rat_scale);
%                         Screen('DrawTexture', theWindow, overall_rat_scale_texture, [0 0 s2 s1],[0 0 W H]);
%                         Screen('PutImage', theWindow, overall_rat_scale); %show the overall rating scale
%                         Screen('Flip', theWindow);
%                         
%                         [~,~,keyCode] = KbCheck;
%                         if keyCode(KbName('space')) == 1
%                             break
%                         elseif keyCode(KbName('q')) == 1
%                             abort_experiment('manual');
%                             break
%                         end
%                     end
%                     
%                     
%                 end
                
                %% (Practice) Continuous & Overall
                
                if practice
                    
                    % bi-directional
                    x = W/2;
                    y = H*(1/2);
                    SetMouse(x,y)
                    
                    while true % button
                        msgtxt = '평가 예제 : 참가자는 충분히 평가 방법을 연습한 후, 연습이 끝나면 버튼을 눌러주시기 바랍니다.';
                        DrawFormattedText(theWindow, double(msgtxt), 'center', H*(1/4), white, [], [], [], 2);
                        Screen('DrawLine', theWindow, white, lb1, H*(1/2), rb1, H*(1/2), 4); %rating scale
                        % penWidth: 0.125~7.000
                        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
                        Screen('DrawLine', theWindow, white, lb1, H*(1/2)-scale_H/3, lb1, H*(1/2)+scale_H/3, 6);
                        Screen('DrawLine', theWindow, white, rb1, H*(1/2)-scale_H/3, rb1, H*(1/2)+scale_H/3, 6);
                        Screen('DrawLine', theWindow, orange, x, H*(1/2)-scale_H/3, x, H*(1/2)+scale_H/3, 6); %rating bar
                        Screen('Flip', theWindow);
                        
                        [x,~,button] = GetMouse(theWindow);
                        if x < lb1; x = lb1; elseif x > rb1; x = rb1; end
                        
                        [~,~,keyCode] = KbCheck;
                        if button(1) == 1
                            break
                        elseif keyCode(KbName('q')) == 1
                            abort_experiment('manual');
                            break
                        end
                        
                    end
                    
                    % go to the next after the button is unpressed
                    while (1)
                        if button(1)
                            while button(1)
                                [~,~,button] = GetMouse(theWindow);
                            end
                            break
                        end
                    end
                    
                    % one-directional
                    x = W*(1/4);
                    y = H*(1/2);
                    SetMouse(x,y)
                    
                    while true % button
                        msgtxt = '평가 예제 : 참가자는 충분히 평가 방법을 연습한 후, 연습이 끝나면 버튼을 눌러주시기 바랍니다.';
                        DrawFormattedText(theWindow, double(msgtxt), 'center', H*(1/4), white, [], [], [], 2);
                        Screen('DrawLine', theWindow, white, lb2, H*(1/2), rb2, H*(1/2), 4); %rating scale
                        % penWidth: 0.125~7.000
                        Screen('DrawLine', theWindow, white, lb2, H*(1/2)-scale_H/3, lb2, H*(1/2)+scale_H/3, 6);
                        Screen('DrawLine', theWindow, white, rb2, H*(1/2)-scale_H/3, rb2, H*(1/2)+scale_H/3, 6);
                        Screen('DrawLine', theWindow, orange, x, H*(1/2)-scale_H/3, x, H*(1/2)+scale_H/3, 6); %rating bar
                        Screen('Flip', theWindow);
                        
                        [x,~,button] = GetMouse(theWindow);
                        if x < lb2; x = lb2; elseif x > rb2; x = rb2; end
                        [~,~,keyCode] = KbCheck;
                        if button(1) == 1
                            break
                        elseif keyCode(KbName('q')) == 1
                            abort_experiment('manual');
                            break
                        end
                        
                    end
                    
                end
                
                % (Main) Continuous
                
                if run
                    
                    while true % Start, Space
                        msgtxt = '\n실험자는 모든 것이 잘 준비되었는지 체크해주세요 (Biopac, Eyelink, 등등).\n\n모두 준비되었으면, 스페이스바를 눌러주세요.';
                        DrawFormattedText(theWindow, double(msgtxt), 'center', 'center', white, [], [], [], 2);
                        Screen('Flip', theWindow);
                        
                        [~,~,keyCode] = KbCheck;
                        if keyCode(KbName('space')) == 1
                            break
                        elseif keyCode(KbName('q')) == 1
                            abort_experiment('manual');
                            break
                        end
                    end
                    
                    while true % Ready, s
                        msgtxt = '참가자가 준비되었으면, 이미징을 시작합니다 (s).';
                        DrawFormattedText(theWindow, double(msgtxt), 'center', 'center', white, [], [], [], 2);
                        Screen('Flip', theWindow);
                        
                        [~,~,keyCode] = KbCheck;
                        if keyCode(KbName('s')) == 1
                            break
                        elseif keyCode(KbName('q')) == 1
                            abort_experiment('manual');
                            break
                        end
                    end
  
                    %% For disdaq : 15 secs
                    % For disdaq ("시작합니다…") : 5 secs
                    
                    data.run_starttime = GetSecs;
                    Screen(theWindow, 'FillRect', bgcolor, window_rect);
                    DrawFormattedText(theWindow, double('시작합니다…'), 'center', 'center', white, [], [], [], 1.2);
                    Screen('Flip', theWindow);
                    waitsec_fromstarttime(data.run_starttime, 1);

                    %For disdaq (blank / EYELINK & BIOPAC START) : 10 secs
                    Screen(theWindow,'FillRect',bgcolor, window_rect);
                    Screen('Flip', theWindow);

                    if USE_EYELINK
                        Eyelink('StartRecording');
                        data.dat.eyetracker_starttime = GetSecs; % eyelink timestamp
                        Eyelink('Message','Continuous Rating Start');
                    end
                    
                    if USE_BIOPAC
                        data.dat.biopac_triggertime = GetSecs; % biopac timestamp
                        BIOPAC_trigger(ljHandle, biopac_channel, 'on');
                        waitsec_fromstarttime(data.dat.biopac_triggertime, 0.6);
                        BIOPAC_trigger(ljHandle, biopac_channel, 'off');
                    end

                    waitsec_fromstarttime(data.run_starttime, 1);  % 5+10
                    

                    %% Continuous rating

                    cont_rat_start_t = GetSecs;
                    data.dat.cont_rating_starttime = cont_rat_start_t;  %run_starttime + 15 secs

                    rec_i = 0;
                    x = W/2;
                    y = H*(1/2);
                    SetMouse(x,y)

                    while GetSecs - cont_rat_start_t < run_dur - 15  % duration of continuous rating
                            rec_i = rec_i + 1;
                            Screen(theWindow, 'FillRect', bgcolor, window_rect);
                            [lb, rb, start_center] = draw_scale_pls('cont_glms');
                            msgtxt = '이 경험이 얼마나 유쾌 혹은 불쾌한지를 지속적으로 보고해주세요.';
                            DrawFormattedText(theWindow, double(msgtxt), 'center', H*(1/4), orange);
                            [x,~,button] = GetMouse(theWindow);
                            if x < lb1; x = lb1; elseif x > rb1; x = rb1; end
                            Screen('Flip', theWindow);

                            
                            cont_rat_cur_t = GetSecs;
                            data.dat.cont_rating_time_fromstart(rec_i,1) = cont_rat_cur_t-cont_rat_start_t;
                            data.dat.cont_rating(rec_i,1) = (x-W/2)/(rb1-lb1).*2;
                            data.dat.changecolor_response(rec_i,1) = button(1);
                            msgbox("error2")

                            %Behavioral task
                            if any(changecolor <= cont_rat_cur_t - cont_rat_start_t & cont_rat_cur_t - cont_rat_start_t <= changecolor + changetime) % It takes 1 sec from the changecolor
                                Screen('DrawLine', theWindow, red, x, H*(1/2)-scale_H/3, x, H*(1/2)+scale_H/3, 6); %rating bar turns in red
                                data.dat.changecolor_appear(rec_i,1) = 1;  % check with changecolor_response whether they are the same

                            else
                                Screen('DrawLine', theWindow, orange, x, H*(1/2)-scale_H/3, x, H*(1/2)+scale_H/3, 6); %rating bar returns to its own color
                                data.dat.changecolor_appear(rec_i,1) = 0;

                            end
                            Screen('Flip', theWindow);
                            msgbox("error3")



                            %save data every 1 min
                            if mod(obj.run_dur, 60) == 0
                                save(data.datafile, 'data', '-append')
                            end

                            [~,~,keyCode] = KbCheck;
                            if keyCode(KbName('q')) == 1
                                abort_experiment('manual');
                                break
                            end

                    end
                    
                        %end anyway after run duration including disdaq (run_dur; total 18 mins)
                        waitsec_fromstarttime(data.run_starttime, obj.run_dur)  % run duration (with disdaq) except 8 secs

                        data.dat.cont_rating_dur = GetSecs - cont_rat_start_t;  % should be equal to run_dur - disdaq

                        if USE_EYELINK
                            Eyelink('Message','Continuous Rating End');
                        end

                        if USE_BIOPAC
                            data.dat.biopac_cont_rat_end = GetSecs; % biopac timestamp
                            BIOPAC_trigger(ljHandle, biopac_channel, 'on');
                            waitsec_fromstarttime(data.dat.biopac_cont_rat_end, 0.8);
                            BIOPAC_trigger(ljHandle, biopac_channel, 'off');
                        end

                    

                    %% MAIN : Postrun questionnaire
                    
                    all_start_t = GetSecs;
                    data.dat.postrun_starttime = all_start_t;
                    ratestim = strcmp(obj.rating_types_pls.postallstims, S.type);
                    % rating_types_pls.postallstims = {'REST', 'CAPS', 'QUIN', 'SWEET', 'TOUCH'};
                    % 1 appears at the right type of this session
                    % Ex: 'TOUCH' session --> 0 0 0 0 1 (logical)
                    scales = obj.rating_types_pls.postalltypes{ratestim};
                    
                    Screen(theWindow, 'FillRect', bgcolor, window_rect);
                    msgtxt = [num2str(SubjRun) '번째 세션이 끝났습니다.\n\n잠시 후 질문들이 제시될 것입니다. 참가자분께서는 기다려주시기 바랍니다.'];
                    msgtxt = double(msgtxt);
                    DrawFormattedText(theWindow, msgtxt, 'center', 'center', white, [], [], [], 2);
                    Screen('Flip', theWindow);
                    
                    if USE_EYELINK
                        Eyelink('Message','Postrun Questionnaires Start');
                    end
                    
                    if USE_BIOPAC
                        data.dat.biopac_postrun_start = GetSecs; % biopac timestamp
                        BIOPAC_trigger(ljHandle, biopac_channel, 'on');
                        waitsec_fromstarttime(data.dat.biopac_postrun_start, 0.3);
                        BIOPAC_trigger(ljHandle, biopac_channel, 'off');
                    end
                    
                    waitsec_fromstarttime(all_start_t, 5)
                    
                    
                    for scale_i = 1:numel(scales)
                        
                        scale = scales{scale_i};
                        [lb, rb, start_center] = draw_scale_pls(scale);
                        
                        Screen(theWindow, 'FillRect', bgcolor, window_rect);
                        
                        start_t = GetSecs;
                        eval(['data.dat.' scale '_starttime = start_t;']);
                        
                        rec_i = 0;
                        ratetype = strcmp(obj.rating_types_pls.alltypes, scale);
                        % corresponding one among all postrun questionnaires
                        % Ex: scale = 'overall_resting_touch_glms' (5th)
                        
                        % Initial position
                        if start_center
                            SetMouse(W/2,H/2); % set mouse at the center
                        else
                            SetMouse(lb,H/2); % set mouse at the left
                        end
                        
                        % Get ratings
                        while true
                            rec_i = rec_i + 1;
                            [x,~,button] = GetMouse(theWindow);
                            [lb, rb, start_center] = draw_scale_pls(scale);
                            if x < lb; x = lb; elseif x > rb; x = rb; end
                            
                            DrawFormattedText(theWindow, double(obj.rating_types_pls.prompts{ratetype}), 'center', H*(1/4), white, [], [], [], 2);
                            Screen('DrawLine', theWindow, orange, x, H*(1/2)-scale_H/3, x, H*(1/2)+scale_H/3, 6); %rating bar
                            Screen('Flip', theWindow);
                            
                            if button(1)
                                while button(1)
                                    [~,~,button] = GetMouse(theWindow);
                                end
                                break
                            end
                            
                            cur_t = GetSecs;
                            eval(['data.dat.' scale '_time_fromstart(rec_i,1) = cur_t-start_t;']);
                            eval(['data.dat.' scale '_rating_trajectory(rec_i,1) = (x-lb)/(rb-lb);']);
                            
                        end
                        
                        end_t = GetSecs;
                        eval(['data.dat.' scale '_rating_endpoint = (x-lb)/(rb-lb);']);
                        eval(['data.dat.' scale '_duration = end_t - start_t;']);
                        
                        % Freeze the screen 0.5 second with red line if overall type
                        freeze_t = GetSecs;
                        while true
                            [lb, rb, start_center] = draw_scale_pls(scale);
                            DrawFormattedText(theWindow, double(obj.rating_types_pls.prompts{ratetype}), 'center', H*(1/4), white, [], [], [], 2);
                            Screen('DrawLine', theWindow, red, x, H*(1/2)-scale_H/3, x, H*(1/2)+scale_H/3, 6);
                            Screen('Flip', theWindow);
                            freeze_cur_t = GetSecs;
                            if freeze_cur_t - freeze_t > 0.5
                                break
                            end
                        end
                        
                        if scale_i == numel(scales)
                            msgtxt = '질문이 끝났습니다.';
                            msgtxt = double(msgtxt); % korean to double
                            DrawFormattedText(theWindow, msgtxt, 'center', 'center', white, [], [], [], 2);
                            Screen('Flip', theWindow);
                            
                            % wait for 2 secs to end
                            postrun_end = GetSecs;
                            waitsec_fromstarttime(postrun_end, 2);
                            
                        end
                        
                    end
                    
                    
                    all_end_t = GetSecs;
                    data.dat.postrun_dur = all_end_t - all_start_t;
                    
                    save(data.datafile, 'data', '-append');
                    
                    
                    if USE_EYELINK
                        Eyelink('Message','Postrun Questionnaires End');
                        eyelink_main(edfFile, 'Shutdown');
                    end
                    
                    if USE_BIOPAC
                        data.dat.biopac_postrun_end = GetSecs; % biopac timestamp
                        BIOPAC_trigger(ljHandle, biopac_channel, 'on');
                        waitsec_fromstarttime(data.dat.biopac_postrun_end, 0.1);
                        BIOPAC_trigger(ljHandle, biopac_channel, 'off');
                    end
                    
                    
                    %% Closing screen
                    
                    while true % Space
                        
                        [~,~,keyCode] = KbCheck;
                        if keyCode(KbName('space'))
                            while keyCode(KbName('space'))
                                [~,~,keyCode] = KbCheck;
                            end
                            break
                        end
                        
                        if keyCode(KbName('q')) == 1
                            abort_experiment('manual');
                            break
                        end
                        
                        msgtxt = [num2str(SubjRun) '번째 세션이 끝났습니다.\n\n세션을 마치려면, 실험자는 스페이스바를 눌러주시기 바랍니다.'];
                        msgtxt = double(msgtxt); % korean to double
                        DrawFormattedText(theWindow, msgtxt, 'center', 'center', white, [], [], [], 2);
                        Screen('Flip', theWindow);
                        
                    end
                    
                    ShowCursor;
                    sca;
                    Screen('CloseAll');
                    
                end
                
                
            catch err
                % ERROR
                disp(err);
                for i = 1:numel(err.stack)
                    disp(err.stack(i));
                end
                abort_experiment('error');
            end
            
            
        end
        
    end
end