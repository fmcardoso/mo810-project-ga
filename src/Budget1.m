function X=Budget1(lista, herois, viloes)

% Todos os herois
todosHerois = [1:381];

% Powergrid medio dos herois
heroisPG = Atributos(lista, todosHerois);

% Powergrid medio do time de viloes
viloesPG = Atributos(lista, viloes);

% Popularidade media dos herois
heroisPop = Popularidade(lista, todosHerois);

% Popularidade media do time de viloes
viloesPop = Popularidade(lista, viloes);

% Razao entre a media dos powergrids e popularidades dos herois e viloes
RatioPG = mean(heroisPG)/mean(viloesPG);
RatioPop = mean(heroisPop)/mean(viloesPop);

% VTCost
VTCost = 0;
for v = 1:length(viloes)
  % Powergrid medio do vilao v
  pgm = mean(Atributos(lista, viloes(v)));
  % Popularidade do vilao v
  pop = Popularidade(lista, viloes(v));
  % VTCost
  VTCost = VTCost + pgm * pop;
endfor

X = RatioPG * RatioPop * VTCost;