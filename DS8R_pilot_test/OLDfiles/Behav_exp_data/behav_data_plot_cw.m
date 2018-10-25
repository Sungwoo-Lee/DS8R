datdir = '/Users/salee/Dropbox/github/pleasure_exp/Behav_exp_data';
clear dat;

mat_sweet = filenames(fullfile(datdir, '*sweet*.mat'));
mat_touch = filenames(fullfile(datdir, '*touch*.mat'));

for i = 1:numel(mat_sweet)
    load(mat_sweet{i});
    overlap_idx = find(diff(data.dat.time_fromstart)==0);  % 겹치는 시간 찾기
    data.dat.time_fromstart(overlap_idx) = [];
    data.dat.cont_rating(overlap_idx) = [];  % 그 부분 없애기
    
    dat.sweet(i,:) = interp1(data.dat.time_fromstart, data.dat.cont_rating, 1:1000);  % 일정하지 않은 timestamp를 일정한 간격(1초)으로 resampling
end

for i = 1:numel(mat_touch)
    load(mat_touch{i});
    overlap_idx = find(diff(data.dat.time_fromstart)==0);
    data.dat.time_fromstart(overlap_idx) = [];
    data.dat.cont_rating(overlap_idx) = [];
    
    dat.touch(i,:) = interp1(data.dat.time_fromstart, data.dat.cont_rating, 1:1000);
end


%% not include time with nans
clf;
subplot(4,1,1);
set(gcf, 'color', 'w');  % gcf: 현재 figure 핸들

for i = 1:size(dat.sweet,1)
    plot(dat.sweet(i,:), 'color', [.7 .7 .7], 'linewidth', 1);
    hold on;
end

idx_nonan = find(sum(isnan(dat.sweet))>=1, 1, 'first')-1;  % 개별데이터들 중에서 첫 번째로 NaN이 나오는(실험이 가장 빨리 끝난) 지점 바로 전 찾기: 332초
wani_plot_shading(1:idx_nonan, mean(dat.sweet(:,1:idx_nonan)), std(dat.sweet(:,1:idx_nonan)), 'alpha', .5)
box off;
xlabel('seconds');
ylabel('pleasantness');
title('Sweet (no-nan time)');

line([0 1000], [0 0], 'color', 'k', 'linestyle', '--', 'linewidth', 1.5);
set(gca, 'linewidth', 1.5, 'fontsize', 15, 'tickdir', 'out')
% gca: 현재 좌표축 또는 차트
% tick marks: 축 눈금

subplot(4,1,2);
for i = 1:size(dat.touch,1)
    plot(dat.touch(i,:), 'color', [.7 .7 .7], 'linewidth', 1);
    hold on;
end

idx_nonan = find(sum(isnan(dat.touch))>=1, 1, 'first')-1;  % 개별데이터들 중에서 첫 번째로 NaN이 나오는(실험이 가장 빨리 끝난) 지점 바로 전 찾기: 311초
wani_plot_shading(1:idx_nonan, mean(dat.touch(:,1:idx_nonan)), std(dat.touch(:,1:idx_nonan)), 'alpha', .5)
box off;
xlabel('seconds');
ylabel('pleasantness');
title('Touch (no-nan time)');

line([0 1000], [0 0], 'color', 'k', 'linestyle', '--', 'linewidth', 1.5);
set(gca, 'linewidth', 1.5, 'fontsize', 15, 'tickdir', 'out')

set(gcf, 'position', [1   395   642   560]);


% include time with nans
subplot(4,1,3);
set(gcf, 'color', 'w');

for i = 1:size(dat.sweet,1)
    plot(dat.sweet(i,:), 'color', [.7 .7 .7], 'linewidth', 1);
    hold on;
end

m = mean(dat.sweet);
nan_m = nanmean(dat.sweet);  % NaN 값 무시하고 개별데이터 전체 평균 구하기
idx_nonan = find(isnan(nan_m), 1, 'first')-1;  % 평균에서 가장 먼저 나오는 NaN 바로 전 지점 찾기: 976초

wani_plot_shading(1:idx_nonan, nanmean(dat.sweet(:,1:idx_nonan)), nanstd(dat.sweet(:,1:idx_nonan)), 'alpha', .3)
box off;
xlabel('seconds');
ylabel('pleasantness');
title('Sweet (whole time)');

line([0 1000], [0 0], 'color', 'k', 'linestyle', '--', 'linewidth', 1.5);
set(gca, 'linewidth', 1.5, 'fontsize', 15, 'tickdir', 'out')

subplot(4,1,4);
for i = 1:size(dat.touch,1)
    plot(dat.touch(i,:), 'color', [.7 .7 .7], 'linewidth', 1);
    hold on;
end

nan_m = nanmean(dat.touch);
idx_nonan = find(isnan(nan_m), 1, 'first')-1;  % 평균에서 가장 먼저 나오는 NaN 바로 전 지점 찾기: 763초

wani_plot_shading(1:idx_nonan, nanmean(dat.touch(:,1:idx_nonan)), nanstd(dat.touch(:,1:idx_nonan)), 'alpha', .3)
box off;
xlabel('seconds');
ylabel('pleasantness');
title('Touch (whole time)');

line([0 1000], [0 0], 'color', 'k', 'linestyle', '--', 'linewidth', 1.5);
set(gca, 'linewidth', 1.5, 'fontsize', 15, 'tickdir', 'out')


