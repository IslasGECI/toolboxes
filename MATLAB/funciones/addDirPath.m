function addDirPath(directorioObjetivo,directorioBase)
%ADDDIRPATH Agrega al PATH la ruta del directorioObjetivo especificado
if nargin == 1
    rutaObjetivo = toolboxes.getDirPath(directorioObjetivo);
elseif nargin == 2
    rutaObjetivo = toolboxes.getDirPath(directorioObjetivo,directorioBase);
end
addpath(genpath(rutaObjetivo));