clear all;

%-------------------------------------------------------------------------- 
% MO810 - Projeto
% Algoritmo Genético
% Team Formation 
%
% Arquivo a ser executado.
% Le arquivos de entrada da pasta '../data/' para execução.
%--------------------------------------------------------------------------



% Lista os arquivos de entrada
dirlist = dir('../data/input/*.txt');


% Itera nos arquivos de entrada
for i = 1:length(dirlist)
	N = dlmread(strcat("../data/input/", dirlist(i).name));

	Principal(N)
end


