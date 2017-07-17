%Copyright © 2017 Gregor Reitzenstein

%Permission is hereby granted, free of charge, to any person obtaining
%a copy of this software and associated documentation files (the "Software"),
%to deal in the Software without restriction, including without limitation
%the rights to use, copy, modify, merge, publish, distribute, sublicense,
%and/or sell copies of the Software, and to permit persons to whom the
%Software is furnished to do so, subject to the following conditions:

%The above copyright notice and this permission notice shall be included
%in all copies or substantial portions of the Software.

%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
%EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
%OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
%IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
%DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
%TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
%OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Prevent recession of older code.
function data = readLTspice(fileName)
    data = readNyquist(fileName)
endfunction

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

function data = readBode(fileName)
    data = fileread(fileName);
    data = strsplit(data, "\n");
    data = strjoin(data(2:numel(data)), "\n");
    data = strrep(data, "\t", ";");
    data = strrep(data, ",", " ");
    data = strrep(data, "°", "");
    data = strrep(data, "dB", "");
    tmp = tempname;
    f = fopen(tmp, "w+");
    fputs(f, data);
    fclose(f);
    data = dlmread(tmp, ";");
endfunction

# vim: filetype=octave
