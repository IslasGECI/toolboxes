function rutaObjetivo = getDataPath
%GETDATOSPATH Devuelve la ruta del directorio: Datos\
warning('Esta es una función obsoleta.')
warning('Esta función regresa la ruta del directorio `datos` que se encuentra dentro la carpeta donde se ejecuta.')
warning('Por favor usa la nueva funcion `toolboxes.getDataPath()`.')
warning('`toolboxes.getDataPath()` regresa la ruta del directorio `datos` comapartido en Drive.')
objetivo = 'datos';
rutaObjetivo = toolboxes.getDirPath(objetivo);
end