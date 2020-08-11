function rutaObjetivo = getExtdataPath(rutaBase)
%GETEXTDATAPATH  Devuelve la ruta del directorio: inst\extdata\
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
directorioObjetivo = ['inst' filesep 'extdata'];
if nargin == 0
        rutaObjetivo = toolboxes.getDirPath(directorioObjetivo);
elseif nargin == 1
        rutaObjetivo = toolboxes.getDirPath(directorioObjetivo,rutaBase);
end