function rutaObjetivo = getDemosPath
%GETDEMOSPATH  Devuelve la ruta del directorio: MATLAB\demostraciones
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
objetivo = ['MATLAB' filesep 'demostraciones'];
rutaObjetivo = toolboxes.getDirPath(objetivo);