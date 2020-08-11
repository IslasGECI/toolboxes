function rutaObjetivo = getDemosPath
%GETDEMOSPATH  Devuelve la ruta del directorio: MATLAB\demostraciones
objetivo = ['MATLAB' filesep 'demostraciones'];
rutaObjetivo = toolboxes.getDirPath(objetivo);