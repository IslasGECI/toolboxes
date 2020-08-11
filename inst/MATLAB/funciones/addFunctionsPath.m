function addFunctionsPath
%ADDFUNCTIONSPATH Agrega al PATH la ruta del directorio: MATLAB\funciones\
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
directorioObjetivo = ['MATLAB' filesep 'funciones'];
toolboxes.addDirPath(directorioObjetivo)
