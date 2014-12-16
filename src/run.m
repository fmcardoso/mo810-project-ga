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

% Arquivo de escrita final 
outputFileName = '../results/results_c.txt'
fileID = fopen(outputFileName,'at');
fprintf(fileID,'\n------ Inicio execucao ----- \n');
fclose(fileID);

% Itera nos arquivos de entrada e executa o algoritmo genetico para cada entrada
for i = 7:length(dirlist)
    viloes = dlmread(strcat('../data/input/', dirlist(i).name));
	Principal(viloes, dirlist(i).name, true, outputFileName);
end


