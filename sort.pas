const
  m = 100;
var
  cmp, swp: integer;

type
  ar = array[1..m] of integer;

procedure generate(p: integer; N: integer; var a: ar);
var i: integer;
begin
  randomize;
  
  a[1] := random(32000);
  if p = 1 then
    for i := 2 to N do
      a[i] := a[i-1] - random(32000);
  
  if p = 2 then
    for i := 2 to N do
      a[i] := a[i-1] + random(32000);
      
  if p > 2 then
    for i := 2 to N do
      a[i] := random(32000);
end;
  
procedure sort_bubble(N: integer; var x: ar);
var i, j, k: integer;
begin
  for i := 1 to N-1 do
    for j := 1 to N-i do begin
      if x[j] < x[j+1] then begin    //если элемент меньше следующего, меняем местами
        k := x[j];
        x[j] := x[j+1];
        x[j+1] := k;
        
      swp := swp + 1;  
      end;
      
      cmp := cmp + 1;
    end;
end; 

procedure sort_Shell(N: integer; var x: ar);
var
  s, i, j, k: integer;
begin
  s := N div 2;
  
  while s > 0 do begin
    for i := 1 to N do begin
      j := i+s;                  //смотрим на элементы, отличающиеся на s позиций
      while j <= N do begin
        if x[i] < x[j] then begin
          k := x[j];                        //если i-й элемент меньше j-го, меняем местами
          x[j] := x[i];
          x[i] := k;
          
          swp := swp + 1;
        end;
        
        cmp := cmp + 1;
        j := j+s;               //переходим на следующий элемент через s позиций
      end;
    end;
     
    s := s div 2;                   //уменьшаем s
  end;
end;

var
  N, i: integer;
  a: ar;
begin
  cmp := 0;
  swp := 0;
  
  
  readln(N);
  generate(2, N, a);
  //for i := 1 to N do read(a[i]);
  for i := 1 to N do write(a[i], ' ');
  writeln;
  //sort_bubble(N, a);
  sort_Shell(N, a);
  for i := 1 to N do write(a[i], ' ');
  writeln;
  write(cmp, ' ', swp);
end.