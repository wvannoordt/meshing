function [fail_out] = p2dwrite3d(filename, X, Y, Z)
  [n11, n12, n13] = size(X);
  [n21, n22, n23] = size(Y);
  [n31, n32, n33] = size(Z);
  nx = n12;
  ny = n11;
  nz = n13;
  if ~(n11 == n21) || ~(n11 == n31) || ~(n12 == n22) || ~(n12 == n32)  || ~(n13 == n23) || ~(n13 == n33)
    msg = ['Unequal matrix sizes!'];
    fail_out = 1;
    error(msg);
  end
  N = 3*ny*nx*nz;
  nline = 3;
  nrowfull = floor(N / nline);
  nres = mod(N, nline);
  output = zeros(ny*nx*nz, 1);
  for idx = 1:nz
  	output(  1+((idx-1)*nx*ny) : ((idx-1)*nx*ny) + nx*ny) = reshape(X(:,:,idx)', ny*nx, 1); reshape(Y(:,:,idx)', ny*nx, 1);
  end
  fid = fopen (filename, "w");
  fdisp(fid,'1');
  dims = [num2str(nx) '    ' num2str(ny) '    ' num2str(nz)];
  fdisp(fid,dims);
  inext = -1;
  for i = 0:(nrowfull - 1)
    n1 = i*nline + 1;
    n2 = n1 + nline - 1;
    inext = n2 +1;
    st = num2str((output(n1:n2))', "%20.15f");
    fdisp(fid,st);
  end
  if inext < N
    st = num2str((output(inext:N))', "%20.15f");
    fdisp(fid,st);
  end
  if length(st) > 0
    fdisp(fid, strtrim(st));
  end
  fclose (fid);
  fail_out = 0;
end
