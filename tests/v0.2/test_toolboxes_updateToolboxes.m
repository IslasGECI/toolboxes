rutaToolboxesInstalado = [getenv('userProfile') '\Documents\MATLAB\library\toolboxes'];
isToolboxesPathThatExists = @() exist(rutaToolboxesInstalado,'dir') == 7;
%% v0.1.0
if isToolboxesPathThatExists()
    rmdir(rutaToolboxesInstalado, 's');
end
assert(~isToolboxesPathThatExists())
rutaToolboxesFuente = ['\\' getenv('computerName') '\toolboxes'];
addpath([rutaToolboxesFuente '\MATLAB\funciones'])
updateToolbox(rutaToolboxesFuente);
assert(isToolboxesPathThatExists())

%% v0.1.1
rutaToolboxesFuente = ['\\' getenv('computerName') '\toolboxes'];
toolboxes.updateToolbox(rutaToolboxesFuente);
assert(isToolboxesPathThatExists())