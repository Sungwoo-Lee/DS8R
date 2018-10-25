function [rand_num_cat, rand_num_perm] = DS8R_pilot_randomnize(GUI_table_data)

% GUI_temp_data = {250 2000 5; 300 2000 5; 350 2000 5; 400 2000 5; 450 2000 2; 500 2000 2;};
GUI_temp_data = GUI_table_data;

size_data = size(GUI_temp_data);
max = 0;
num_cat = zeros(1,size_data(1));

for i = 1 : size_data(1)
    if max < GUI_temp_data{i,3}
        max = GUI_temp_data{i,3};
    end
    num_cat(1,i) = GUI_temp_data{i,3};
end

rand_num_matrix = zeros(max, size_data(1));

for i = 1 : max
   for j = 1 : size_data(1)
       if num_cat(1,j) > 0
           rand_num_matrix(i,j) = 1;
           num_cat(1,j) = num_cat(1,j) - 1;
       end
   end
end

rand_num_cout = sum(rand_num_matrix,2);
rand_num_cat = [];

for i = 1 : max
    rand_num_cout(i);
    rand_num_cat = horzcat(rand_num_cat, randperm(rand_num_cout(i)));
end

rand_num_perm = randperm(length(rand_num_cat));

end
