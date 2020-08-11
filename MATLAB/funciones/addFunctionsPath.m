function addFunctionsPath
%ADDFUNCTIONSPATH Agrega al PATH la ruta del directorio: MATLAB\funciones\
directorioObjetivo = ['MATLAB' filesep 'funciones'];
toolboxes.addDirPath(directorioObjetivo)
