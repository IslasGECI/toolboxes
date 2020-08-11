function rutaObjetivo = getClassesPath
%GETCLASSESPATH  Devuelve la ruta del directorio: MATLAB\clases\
objetivo = ['MATLAB' filesep 'clases'];
rutaObjetivo = toolboxes.getDirPath(objetivo);