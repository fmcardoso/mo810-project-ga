function X=Budget2(lista, herois, viloes)

% Todos os viloes e seu powergrid medio e do time de viloes
todos = [382:767];
todosPG = Atributos(lista, todos);
viloesPG = Atributos(lista, viloes);

% Factor
factor = viloesPG/todosPG;

% Powergrid e popularidade medios dos herois
heroisPG = mean(Atributos(lista, herois(herois>0)));
heroisPop = Popularidade(lista, herois(herois>0));

% VTSize
VTSize = length(viloes);

X = factor * heroisPG * heroisPop * VTSize;