function rutaObjetivo = getMatlabPath
%GETMATLABPATH  Devuelve la ruta del directorio: MATLAB\
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
objetivo = 'MATLAB';
rutaObjetivo = toolboxes.getDirPath(objetivo);