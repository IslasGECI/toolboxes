function rutaObjetivo = getResultsPath(rutaBase)
%GETRESULTSPATH  Devuelve la ruta del directorio: resultados\
directorioObjetivo = 'resultados';
if nargin == 0
        rutaObjetivo = toolboxes.getDirPath(directorioObjetivo);
elseif nargin == 1
        rutaObjetivo = toolboxes.getDirPath(directorioObjetivo,rutaBase);
end