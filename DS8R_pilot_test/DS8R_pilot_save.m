function DS8R_pilot_save(SID, SubjNum, basedir)

    global data
    
    savedir = fullfile(basedir, 'Data');

    nowtime = clock;
    SubjDate = sprintf('%.2d%.2d%.2d', nowtime(1), nowtime(2), nowtime(3));

    data.subject = SID;
    data.datafile = fullfile(savedir, [SubjDate, '_', sprintf('%.3d', SubjNum), '_', SID, '_DS8R', '.mat']);
    data.version = 'DS8R_v1_10-24-2018_Cocoanlab';  % month-date-year
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