function addDataPath
%ADDDATOSPATH Agrega al PATH la ruta del directorio: Datos\
warning('Esta es una función obsoleta.')
warning('Esta función agrega al _path_ de MATLAB el directorio `datos` que se encuentra dentro la carpeta donde se ejecuta.')
warning('Por favor usa la nueva función `toolboxes.addDataPath()`.')
warning('`toolboxes.addDataPath()` agrega al _path_ de MATLAB el directorio `datos` comapartido en Drive.')
objetivo = 'datos';
toolboxes.addDirPath(objetivo)
end