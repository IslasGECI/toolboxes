function rutaObjetivo = getFunctionsPath
%GETFUNCTIONSPATH  Devuelve la ruta del directorio: MATLAB\funciones\
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
objetivo = ['MATLAB' filesep 'funciones'];
rutaObjetivo = toolboxes.getDirPath(objetivo);