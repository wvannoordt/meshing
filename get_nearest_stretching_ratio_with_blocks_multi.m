function [X] = get_nearest_stretching_ratio_with_blocks_multi(x_values, dx, ratio, block_size, nbuffer)
	X = [];
	do_reverse = 1;
	init = 1;
	for i = 2:length(x_values)
		x0 = x_values(i-1);
		x1 = x_values(i);
		x_temp = [];
		if do_reverse
			x_temp = get_nearest_stretching_ratio_with_blocks_reverse(x0, x1, dx(i-1), ratio(i-1), block_size, nbuffer);
			do_reverse = 0;
		else
			x_temp = get_nearest_stretching_ratio_with_blocks(x0, x1, dx(i-1), ratio(i-1), block_size, nbuffer);
			do_reverse = 1;
		end

		if init
			X = x_temp;
			init = 0
		else
			X = join(X, x_temp);
		end
	end
end
