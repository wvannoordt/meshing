function [] = meshview(X, Y)
	xmin = min(min(X));
	xmax = max(max(X));
	ymin = min(min(Y));
	ymax = max(max(Y));
	mesh(X, Y, 0*X)
	view([0 90])
	pbaspect([(xmax - xmin)/(ymax - ymin) 1 1])
end
