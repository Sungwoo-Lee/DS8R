function DS8R_pilot_run(GUI_table_data, Trials_num, explain, practice, run)

    global W H window_ratio window_num window_rect theWindow fontsize font %window property
    global lb1 rb1 lb2 rb2 scale_H  %rating scale
    global bgcolor white orange red  %color        
    global data
    
    data.dat.pilot_start_time = GetSecs;

try
    %% (Explain) Continuous & Overall        
        % Explain bi-directional scale with visualization
        if explain
            while true % Button
                msgtxt = '지금부터 실험이 시작됩니다.\n\n먼저, 실험을 진행하기에 앞서 평가 척도에 대한 설명을 진행하겠습니다.\n\n참가자는 모든 준비가 완료되면 마우스를 눌러주시기 바랍니다.\n\n Push Mouse button';
                DrawFormattedText(theWindow, double(msgtxt), 'center', 'center', white, [], [], [], 2);
                Screen('Flip', theWindow);
                
                [x,~,button] = GetMouse(theWindow);
                [~,~,keyCode] = KbCheck;
                if button(1) == 1
                    break
                elseif keyCode(KbName('q')) == 1
                    abort_experiment('manual');
                    break
                end
            end
            % Explain one-directional scale with visualization
            
            
            while true % Space
                Screen(theWindow, 'FillRect', bgcolor, window_rect);
                overall_rat_scale = imread('gLMS_unidirectional_rating_scale','jpg');
                [s1, s2, s3] = size(overall_rat_scale);
                overall_rat_scale_texture = Screen('MakeTexture', theWindow, overall_rat_scale);
                Screen('DrawTexture', theWindow, overall_rat_scale_texture, [0 0 s2 s1],[0 0 W H]);
                Screen('PutImage', theWindow, overall_rat_scale); %show the overall rating scale
                Screen('Flip', theWindow);
                
                [~,~,keyCode] = KbCheck;
                if keyCode(KbName('space')) == 1
                    break
                elseif keyCode(KbName('q')) == 1
                    abort_experiment('manual');
                    break
                end
                if ~practice & ~run
                    abort_experiment('manual');
                end
            end
        end
    
    %% (Practice) Continuous & Overall
    
    if practice
        
        % one-directional
        x = W*(1/4);
        y = H*(1/2);
        SetMouse(x,y)  

        
        while true % To finish practice, push button
            msgtxt = '참가자는 충분히 평가 방법을 연습한 후 \n\n 연습이 끝나면 버튼을 눌러주시기 바랍니다.';
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
        
        if ~run
            abort_experiment('manual');
        end
        
    end
    
    %% (Main) Continuous
    
    if run
        
        while true % To Start, Push Space
            msgtxt = '\n모두 준비되었으면, 스페이스바를 눌러주세요.\n\n If you are ready, Push space';
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

        %% For disdaq : 15 secs
        % For disdaq ("Start…")
        data.run_starttime = GetSecs;
        Screen(theWindow, 'FillRect', bgcolor, window_rect);
        DrawFormattedText(theWindow, double('시작합니다…'), 'center', 'center', white, [], [], [], 1.2);
        Screen('Flip', theWindow);
        waitsec_fromstarttime(data.run_starttime, 3); %Wait for 3 seconds to start
        
        Screen(theWindow,'FillRect',bgcolor, window_rect);
        Screen('Flip', theWindow);
        
        [~,~,keyCode] = KbCheck;
        if keyCode(KbName('q')) == 1
            abort_experiment('manual');
        end
        
        waitsec_fromstarttime(data.run_starttime, 1);
        
        
       %% Setting the DS8R parameters to objects
                
        size_array = size(GUI_table_data); % Getting the size of parameter data
        for i = 1:size_array(1)
            if ~isnumeric(GUI_table_data{i,1})
                GUI_table_data(i,:) = []; % Remove empty row of parameter data table
            end
            if i == size_array(1)
                break
            end
        end
        
        size_array = size(GUI_table_data);
        DS8R_class_obj(size_array(1)) = DS8R_class; % initialize the object of DS8R_class
        for i = 1:size_array(1)
            if isnumeric(GUI_table_data{i,1})
                set_DS8R(DS8R_class_obj(i), 'Demand', GUI_table_data{i,1}, 'PulseWidth', GUI_table_data{i,2}) % Setting the parameter values to DS8R_class objects
            end
        end
        
        random_number_order_count = 1; % To count the number of random orders in rand_num_perm
        [rand_num_cat, rand_num_perm] = DS8R_pilot_randomnize(GUI_table_data); % Making random order, this should be outside of for loop of main experiment code
        rand_num_cat
        rand_num_perm

        for  trial= 1 : Trials_num      
            data.run_starttime = GetSecs;
            Screen(theWindow, 'FillRect', bgcolor, window_rect);
            DrawFormattedText(theWindow, double('+'), 'center', 'center', white, [], [], [], 1.2);
            Screen('Flip', theWindow);
            
            if trial == 1
                waitsec_fromstarttime(data.run_starttime, 4);
            else
                trials_interval_time = randi([5 7]);
                trials_interval_time
                waitsec_fromstarttime(data.run_starttime, trials_interval_time);
            end
            
            exe_DS8R(DS8R_class_obj(rand_num_cat(1,rand_num_perm(1,random_number_order_count))))
%             waitsec_fromstarttime(GetSecs, 0.1);
%             exe_DS8R(DS8R_class_obj(rand_num_cat(1,rand_num_perm(1,random_number_order_count))))
            
            waitsec_fromstarttime(GetSecs, 1);
     
            Screen(theWindow, 'FillRect', bgcolor, window_rect);
            Screen('Flip', theWindow);
            
            
            
           %% MAIN : Postrun questionnaire
           rating_types_pls = call_ratingtypes_pls;
            
           all_start_t = GetSecs;
           data.dat.postrun_starttime = all_start_t;

           scale = ('overall_int');
           [lb, rb, start_center] = draw_scale_pls(scale);
           Screen(theWindow, 'FillRect', bgcolor, window_rect);
           
           start_t = GetSecs;
           eval(['data.dat.' scale '_starttime = start_t;']);
           
           ratetype = strcmp(rating_types_pls.alltypes, scale);
           
           % Initial position
           if start_center
               SetMouse(W/2,H/2); % set mouse at the center
           else
               SetMouse(lb,H/2); % set mouse at the left
           end
           
           % Get ratings
           while true
               [x,~,button] = GetMouse(theWindow);
               [lb, rb, start_center] = draw_scale_pls(scale);
               if x < lb; x = lb; elseif x > rb; x = rb; end
               
               DrawFormattedText(theWindow, double(rating_types_pls.prompts{ratetype}), 'center', H*(1/4), white, [], [], [], 2);
               Screen('DrawLine', theWindow, orange, x, H*(1/2)-scale_H/3, x, H*(1/2)+scale_H/3, 6); %rating bar
               Screen('Flip', theWindow);
               
               if button(1)
                   while button(1)
                       [~,~,button] = GetMouse(theWindow);
                   end
                   break
               end     
               
               [~,~,keyCode] = KbCheck;
               if keyCode(KbName('q')) == 1
                   abort_experiment('manual');
                   break
               end 
           end
           
           end_t = GetSecs;
           data.dat.overall_int_rating_endpoint(1,trial) = DS8R_class_obj(rand_num_cat(1,rand_num_perm(1,random_number_order_count))).Demand;
           data.dat.overall_int_rating_endpoint(2,trial) = (x-lb)/(rb-lb);
           eval(['data.dat.' scale '_duration = end_t - start_t;']);
           
           Screen(theWindow, 'FillRect', bgcolor, window_rect);
           Screen('Flip', theWindow);
           waitsec_fromstarttime(GetSecs, 1);
           
           save(data.datafile, 'data', '-append');
           random_number_order_count = random_number_order_count + 1;
           
        end
        data.dat.pilot_end_time = GetSecs;
        data.dat.pilot_duration_time = data.dat.pilot_end_time -  data.dat.pilot_start_time;
        save(data.datafile, 'data', '-append');
        %% Closing screen
        
        while true % To finish run, Push Space
            
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
            


            msgtxt = ['실험이 끝났습니다(Run is finished).\n\n세션을 마치려면, \n\n실험자는 스페이스바를 눌러주시기 바랍니다.(Please push space)'];
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