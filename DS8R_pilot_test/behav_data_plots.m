% Touch
%behav_results_touch-1
close
figure
suptitle('Touch result 1')
load('20180827_JJL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y)
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('JJL 180827')
load('20180827_BK_subj002_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y)
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('BK 180827')
load('20180827_LK_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y)
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('LK 180827')

%behav_results_touch-2
figure
suptitle('Touch result 2')
load('20180829_SYL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 530 -0.1 0.8]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SYL 180829')
load('20180901_DEL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('DEL 180901')
load('20180901_SYL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SYL 180901')

%behav_results_touch-3
figure
suptitle('Touch result 3')
load('20180827_SHG_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SHG 180827')
load('20180828_YWH_subj002_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 600 -0.1 0.5]);xlabel('time (secs)', 'FontSize', 10);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('YWH 180828')
load('20180903_HBK_subj002_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('HBK 180903')

%behav_results_touch-4
figure
suptitle('Touch result 4')
load('20180905_JHH_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 800 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('JHH 180905')
load('20180905_JWP_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 500 -0.1 0.7]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('JWP 180905')
load('20180907_HJK_subj002_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 500 -0.4 0.6]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('HJK 180907')


% Sweet
%behav_results_sweet-1
close
figure
suptitle('Sweet result 1')
load('20180901_DEL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 700 -0.3 0.6]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('DEL 180901')
load('20180901_SYL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 600 -0.3 0.4]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SYL 180901')
load('20180903_SWL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 600 -0.3 0.8]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SWL 180903')

%behav_results_sweet-2
close
figure
suptitle('Sweet result 2')
load('20180904_SHG_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SHG 180904')
load('20180904_JJL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 600 -0.1 0.7]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('JJL 180904')
load('20180904_BK_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 600 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('BK 180904')

%behav_results_sweet-3
close
figure
suptitle('Sweet result 3')
load('20180905_JHH_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 500 -0.1 0.6]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('JHH 180905')
load('20180905_HBK_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 500 -0.1 0.6]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('HBK 180905')
load('20180905_SYL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 500 -0.1 0.6]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SYL 180905')

%behav_results_sweet-4
close
figure
suptitle('Sweet result 4')
load('20180907_HJK_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(2,1,1);
plot(x,y) 
axis([0 800 0 0.8]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('HJK 180907')
load('20180907_LK_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(2,1,2);
plot(x,y) 
axis([0 800 0 0.4]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('LK 180907')
% load('20180905_JWP_subj001_behav_dat_sweet.mat')
% x = data.dat.time_fromstart;
% y = data.dat.cont_rating;
% subplot(3,1,3);
% plot(x,y) 
% axis([0 500 -0.5 0.1]);
% xlabel('time (secs)', 'FontSize', 10);
% ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% % title('JWP 180905')

% load('20180907_YWH_subj001_behav_dat_sweet.mat')
% x = data.dat.time_fromstart;
% y = data.dat.cont_rating;
% subplot(3,1,1);
% plot(x,y) 
% axis([0 500 0 0.5]);
% xlabel('time (secs)', 'FontSize', 10);
% ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('YWH 180907')

%% All 'Touch' behav data
figure
load('20180905_JHH_subj001_behav_dat_touch.mat')
x10 = data.dat.time_fromstart;
y10 = data.dat.cont_rating;
plot(x10,y10,'color',[0.5 0.5 0.5]) 
hold on
load('20180827_JJL_subj001_behav_dat_touch.mat')
x1 = data.dat.time_fromstart;
x1(numel(x1)+1:numel(x10)) = NaN;
y1 = data.dat.cont_rating;
y1(numel(y1)+1:numel(y10)) = NaN;
plot(x1,y1,'color',[0.5 0.5 0.5])
hold on
load('20180827_BK_subj002_behav_dat_touch.mat')
x2 = data.dat.time_fromstart;
x2(numel(x2)+1:numel(x10)) = NaN;
y2 = data.dat.cont_rating;
y2(numel(y2)+1:numel(y10)) = NaN;
plot(x2,y2,'color',[0.5 0.5 0.5])
hold on 
load('20180827_LK_subj001_behav_dat_touch.mat')
x3 = data.dat.time_fromstart;
x3(numel(x3)+1:numel(x10)) = NaN;
y3 = data.dat.cont_rating;
y3(numel(y3)+1:numel(y10)) = NaN;
plot(x3,y3,'color',[0.5 0.5 0.5])
hold on
load('20180829_SYL_subj001_behav_dat_touch.mat')
x4 = data.dat.time_fromstart;
x4(numel(x4)+1:numel(x10)) = NaN;
y4 = data.dat.cont_rating;
y4(numel(y4)+1:numel(y10)) = NaN;
plot(x4,y4,'color',[0.5 0.5 0.5]) 
hold on
load('20180901_DEL_subj001_behav_dat_touch.mat')
x5 = data.dat.time_fromstart;
x5(numel(x5)+1:numel(x10)) = NaN;
y5 = data.dat.cont_rating;
y5(numel(y5)+1:numel(y10)) = NaN;
plot(x5,y5,'color',[0.5 0.5 0.5]) 
hold on
load('20180901_SYL_subj001_behav_dat_touch.mat')
x6 = data.dat.time_fromstart;
x6(numel(x6)+1:numel(x10)) = NaN;
y6 = data.dat.cont_rating;
y6(numel(y6)+1:numel(y10)) = NaN;
plot(x6,y6,'color',[0.5 0.5 0.5]) 
hold on
load('20180827_SHG_subj001_behav_dat_touch.mat')
x7 = data.dat.time_fromstart;
x7(numel(x7)+1:numel(x10)) = NaN;
y7 = data.dat.cont_rating;
y7(numel(y7)+1:numel(y10)) = NaN;
plot(x7,y7,'color',[0.5 0.5 0.5]) 
hold on
load('20180828_YWH_subj002_behav_dat_touch.mat')
x8 = data.dat.time_fromstart;
x8(numel(x8)+1:numel(x10)) = NaN;
y8 = data.dat.cont_rating;
y8(numel(y8)+1:numel(y10)) = NaN;
plot(x8,y8,'color',[0.5 0.5 0.5]) 
hold on
load('20180903_HBK_subj002_behav_dat_touch.mat')
x9 = data.dat.time_fromstart;
x9(numel(x9)+1:numel(x10)) = NaN;
y9 = data.dat.cont_rating;
y9(numel(y9)+1:numel(y10)) = NaN;
plot(x9,y9,'color',[0.5 0.5 0.5]) 
load('20180905_JWP_subj001_behav_dat_touch.mat')
x11 = data.dat.time_fromstart;
x11(numel(x11)+1:numel(x10)) = NaN;
y11 = data.dat.cont_rating;
y11(numel(y11)+1:numel(y10)) = NaN;
plot(x11,y11,'color',[0.5 0.5 0.5]) 
axis([0 500 -0.1 0.7]);
hold on
load('20180907_HJK_subj002_behav_dat_touch.mat')
x12 = data.dat.time_fromstart;
x12(numel(x12)+1:numel(x10)) = NaN;
y12 = data.dat.cont_rating;
y12(numel(y12)+1:numel(y10)) = NaN;
plot(x12,y12,'color',[0.5 0.5 0.5]) 
hold on

x = [x1';x2';x3';x4';x5';x6';x7';x8';x9';x10';x11';x12'];  % concatenate in a row
y = [y1';y2';y3';y4';y5';y6';y7';y8';y9';y10';y11';y12'];  % concatenate in a row

% figure
% plot(y')
y(isnan(y)) = 0;

mean_y = mean(y);
std_y = std(y);
wani_plot_shading(1:size(y,2), mean_y, std_y, 'color', [207 83 0]/255, 'alpha', .3);
axis([0 800 -0.4 0.8]);
title('All Touch behav data')
xlabel('time (total: about 753 secs)')  % 1 sec = about 60.3341
ylabel('pleasure rating (-1 ~ 1)')

%% All 'Sweet' behav data
figure
load('20180901_DEL_subj001_behav_dat_sweet.mat')
x10 = data.dat.time_fromstart;
y10 = data.dat.cont_rating;
plot(x10,y10,'color',[0.5 0.5 0.5]) 
hold on
load('20180901_SYL_subj001_behav_dat_sweet.mat')
x1 = data.dat.time_fromstart;
x1(numel(x1)+1:numel(x10)) = NaN;
y1 = data.dat.cont_rating;
y1(numel(y1)+1:numel(y10)) = NaN;
plot(x1,y1,'color',[0.5 0.5 0.5])
hold on
load('20180903_SWL_subj001_behav_dat_sweet.mat')
x2 = data.dat.time_fromstart;
x2(numel(x2)+1:numel(x10)) = NaN;
y2 = data.dat.cont_rating;
y2(numel(y2)+1:numel(y10)) = NaN;
plot(x2,y2,'color',[0.5 0.5 0.5])
hold on 
load('20180904_SHG_subj001_behav_dat_sweet.mat')
x3 = data.dat.time_fromstart;
x3(numel(x3)+1:numel(x10)) = NaN;
y3 = data.dat.cont_rating;
y3(numel(y3)+1:numel(y10)) = NaN;
plot(x3,y3,'color',[0.5 0.5 0.5])
hold on
load('20180904_BK_subj001_behav_dat_sweet.mat')
x4 = data.dat.time_fromstart;
x4(numel(x4)+1:numel(x10)) = NaN;
y4 = data.dat.cont_rating;
y4(numel(y4)+1:numel(y10)) = NaN;
plot(x4,y4,'color',[0.5 0.5 0.5]) 
hold on
load('20180905_JHH_subj001_behav_dat_sweet.mat')
x5 = data.dat.time_fromstart;
x5(numel(x5)+1:numel(x10)) = NaN;
y5 = data.dat.cont_rating;
y5(numel(y5)+1:numel(y10)) = NaN;
plot(x5,y5,'color',[0.5 0.5 0.5]) 
hold on
load('20180905_HBK_subj001_behav_dat_sweet.mat')
x6 = data.dat.time_fromstart;
x6(numel(x6)+1:numel(x10)) = NaN;
y6 = data.dat.cont_rating;
y6(numel(y6)+1:numel(y10)) = NaN;
plot(x6,y6,'color',[0.5 0.5 0.5]) 
hold on
load('20180905_SYL_subj001_behav_dat_sweet.mat')
x7 = data.dat.time_fromstart;
x7(numel(x7)+1:numel(x10)) = NaN;
y7 = data.dat.cont_rating;
y7(numel(y7)+1:numel(y10)) = NaN;
plot(x7,y7,'color',[0.5 0.5 0.5]) 
hold on
load('20180907_HJK_subj001_behav_dat_sweet.mat')
x8 = data.dat.time_fromstart;
x8(numel(x8)+1:numel(x10)) = NaN;
y8 = data.dat.cont_rating;
y8(numel(y8)+1:numel(y10)) = NaN;
plot(x8,y8,'color',[0.5 0.5 0.5]) 
hold on
load('20180907_LK_subj001_behav_dat_sweet.mat')
x9 = data.dat.time_fromstart;
x9(numel(x9)+1:numel(x10)) = NaN;
y9 = data.dat.cont_rating;
y9(numel(y9)+1:numel(y10)) = NaN;
plot(x9,y9,'color',[0.5 0.5 0.5]) 
load('20180904_JJL_subj001_behav_dat_sweet.mat')
x11 = data.dat.time_fromstart;
x11(numel(x11)+1:numel(x10)) = NaN;
y11 = data.dat.cont_rating;
y11(numel(y11)+1:numel(y10)) = NaN;
plot(x11,y11,'color',[0.5 0.5 0.5]) 
hold on

x = [x1';x2';x3';x4';x5';x6';x7';x8';x9';x10';x11'];  % concatenate in a row
y = [y1';y2';y3';y4';y5';y6';y7';y8';y9';y10';y11'];  % concatenate in a row

% figure
% plot(y')
y(isnan(y)) = 0;

mean_y = mean(y);
std_y = std(y);
wani_plot_shading(1:size(y,2), mean_y, std_y, 'color', [207 83 0]/255, 'alpha', .3);
axis([0 950 -0.4 0.8]);
title('All Sweet behav data')
xlabel('time (total: about 949 secs)')  % 1 sec = about 63.8203
ylabel('pleasure rating (-1 ~ 1)')