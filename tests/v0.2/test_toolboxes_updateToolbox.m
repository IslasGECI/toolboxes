toolboxSharedPath = @(nombreToolbox) ['\\' getenv('computerName') '\' nombreToolbox];
rutaToolboxes = toolboxSharedPath('toolboxes');
%%
% Se puede instalar a sí misma usando import
import toolboxes.*
updateToolbox(rutaToolboxes);

%%
% Se puede instalar a sí misma usando el namespace
rutaToolboxes = toolboxSharedPath('toolboxes');
toolboxes.updateToolbox(rutaToolboxes);

%%
%
rutaFileexchange = toolboxSharedPath('fileexchange');
toolboxes.updateToolbox(rutaFileexchange);

%%
%
rutaFileexchange = toolboxSharedPath('misctools');
toolboxes.updateToolbox(rutaFileexchange);
