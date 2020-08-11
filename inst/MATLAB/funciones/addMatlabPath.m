function addMatlabPath
%ADDMATLABPATH Agrega al PATH la ruta del directorio: MATLAB\
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
objetivo = 'MATLAB';
toolboxes.addDirPath(objetivo)
