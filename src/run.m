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

fileID = fopen('exp.txt','at');
fprintf(fileID,'\n------ Inicio execucao ----- \n');
fclose(fileID);


% Itera nos arquivos de entrada
for i = 1:length(dirlist)
%	i = 3
    viloes = dlmread(strcat('../data/input/', dirlist(i).name));
	Principal(viloes, dirlist(i).name);
	%ErroForcado
end


