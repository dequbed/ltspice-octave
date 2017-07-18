function data = readNyquist(fileName)
  data = fileread(fileName);
  data = strsplit(data, "\n");
  data = strjoin(data(2:numel(data)), "\n");
  data = strrep(data, "\t", ";");
  data = strrep(data, ",", " ");
  tmp = tempname;
  f = fopen(tmp, "w+");
  fputs(f, data);
  fclose(f);
  data = dlmread(tmp, ";");
endfunction
