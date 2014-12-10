function X=MatrizRelacoes(filename)

% Le um arquivo CSV e busca lista de experiencia
L = dlmread(filename, ";");
L = L(2:size(L,1), :);

% Cria matriz de adjacencias
n = max(L(:,1:2)(:));
X = zeros(n);
for i = 1:size(L,1)
  X(L(i,1),L(i,2)) = L(i,3);
endfor