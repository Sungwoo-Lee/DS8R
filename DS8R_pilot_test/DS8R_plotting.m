function DS8R_plotting(pathname, filename)
global data

fullpathname = strcat(pathname, filename);
set(handles.filename_text, 'String', fullpathname)

figure
suptitle('DS8R result')
load(fullpathname)
x = data.dat.overall_int_rating_endpoint(1,:);
y = data.dat.overall_int_rating_endpoint(2,:);
scatter(x,y)
axis([100 500 0 1.0]);
xlabel('Demends', 'FontSize', 10, 'Color', 'w');
ylabel('Rating', 'FontSize', 10, 'Color', 'w');
