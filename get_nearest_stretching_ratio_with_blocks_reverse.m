function [points_out, nx] = get_nearest_stretching_ratio_with_blocks_reverse(xmin, xmax, dx, ratio, block_size, nbuffer)
	%assume you know xmin, xmax, use a fixed wall spacing and stretching ratio and get the number of necesssary points to achieve that. Restrain number of necessary points to a multiple of
	%block size
	
	r = (xmax - xmin) / dx;
	nx_cont = log(1 - r * (1 - ratio)) / log(ratio);
	
	nx = block_size*round(nx_cont/block_size)+1;
	[points_out, ratio_approx] = get_spaced_values_reverse_buf(xmin, xmax, dx, nx, nbuffer);
end
