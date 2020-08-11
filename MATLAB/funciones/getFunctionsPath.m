function rutaObjetivo = getFunctionsPath
%GETFUNCTIONSPATH  Devuelve la ruta del directorio: MATLAB\funciones\
objetivo = ['MATLAB' filesep 'funciones'];
rutaObjetivo = toolboxes.getDirPath(objetivo);