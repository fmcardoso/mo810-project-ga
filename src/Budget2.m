function X=Budget2(lista, herois, viloes)

% Todos os viloes
todosHerois = [1:381];
todosViloes = [382:767];

% Powergrid medio dos viloes
todosViloesPG = Atributos(lista, todosViloes);

% Powergrid medio do time dos viloes
viloesPG = Atributos(lista, viloes);

% Factor
factor = viloesPG/todosViloesPG;

% Powergrid medio do herois
heroisPG = mean(Atributos(lista, todosHerois));

% Popularidade media dos herois
heroisPop = Popularidade(lista, todosHerois);

% VTSize
VTSize = length(viloes);

X = factor * heroisPG * heroisPop * VTSize;