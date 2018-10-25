figure
suptitle('DS8R result')
load('20181024_001_lada_test_DS8R_run01.mat')
x = data.dat.overall_int_rating_endpoint(1,:);
y = data.dat.overall_int_rating_endpoint(2,:);
scatter(x,y)
axis([80 520 -0.1 0.5])
xlabel('Demends', 'FontSize', 10, 'Color', 'w');
ylabel('Rating', 'FontSize', 10, 'Color', 'w');

hold on

load('20181024_001_lada_test2_DS8R_run01.mat')
x = data.dat.overall_int_rating_endpoint(1,:);
y = data.dat.overall_int_rating_endpoint(2,:);
scatter(x,y)
% axis([80 520 -0.1 0.5])
% xlabel('Demends', 'FontSize', 10, 'Color', 'w');
% ylabel('Rating', 'FontSize', 10, 'Color', 'w');