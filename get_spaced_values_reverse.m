function [x, k] = get_spaced_values_reverse(initial_x, end_x, initial_spacing, N)
[z, k] = get_spaced_values(initial_x, end_x, initial_spacing, N);
x = initial_x + (end_x - z);
x = flipud(x);
end

