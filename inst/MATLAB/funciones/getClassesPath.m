function rutaObjetivo = getClassesPath
%GETCLASSESPATH  Devuelve la ruta del directorio: MATLAB\clases\
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
objetivo = ['MATLAB' filesep 'clases'];
rutaObjetivo = toolboxes.getDirPath(objetivo);