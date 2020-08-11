function rutaObjetivo = getDirPath(directorioObjetivo, directorioBase)
%GETDIRPATH  Devuelve la ruta del directorioObjetivo especificado
pila = dbstack('-completenames',1);
nPilas = length(pila);
for iPila=nPilas:-1:1
    if ~(isempty(strfind(pila(iPila).name,'Path')) ...
            || isempty(strfind(pila(iPila).file,'toolboxes')))
        pila(iPila)=[];
    end
end
if isempty(pila) || nargin == 2
    if nargin == 1
        directorioBase = pwd;
    end
    ruta = [directorioBase filesep];
else
    ruta = pila(1).file;
end
i = strfind(ruta,filesep);
esObjetivo = false;
while length(ruta)>3 && ~esObjetivo
    ruta = ruta(1:i(end));
    rutaObjetivo = [ruta directorioObjetivo];
    esObjetivo = exist(rutaObjetivo,'dir');
    i=i(1:end-1);
end
if ~esObjetivo
    rutaObjetivo = '';
    error(['ERROR: No pude encontrar el directorio <strong>' directorioObjetivo '</strong>'])
end
