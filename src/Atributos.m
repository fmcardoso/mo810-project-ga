function X=Atributos(lista, id)

% Calcula atributos individuais ou do time de acordo com o 'id'
A = lista(:, 1:6);
if (id > 0)
  X = sum(A(id,:), 1);
else
  X = [0 0 0 0 0 0];
endif