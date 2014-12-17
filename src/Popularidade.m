function X=Popularidade(lista, id)

% Calcula popularidade individual ou do time de acordo com o 'id'
if (id > 0)
  X = sum(lista(id,7), 1);
else
  X = 0;
endif