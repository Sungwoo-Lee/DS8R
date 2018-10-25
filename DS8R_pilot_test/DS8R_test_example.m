global theWindow W H window_ratio window_num window_rect fontsize font %window property
global lb1 rb1 lb2 rb2 scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color
global basedir data
    
basedir = pwd;
cd(basedir);
addpath(genpath(basedir));

explain = true;
practice = true;
run = true; 

GUI_table_data = {100 2000 5; 180 2000 5; 260 2000 5; 340 2000 5; 420 2000 2; 500 2000 2;}; %This have to be cell array

SID = 'test1';
SubjNum = 1;
SubjRun = 1;
Trials_num = 10;
Screen_mode = 'Testmode';

DS8R_pilot_save(SID, SubjNum, SubjRun, basedir)
DS8R_pilot_setscreen(Screen_mode)
DS8R_pilot_run(GUI_table_data, Trials_num, explain, practice, run)
