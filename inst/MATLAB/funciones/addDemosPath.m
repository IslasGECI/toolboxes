function addDemosPath
%ADDDEMOSPATH Agrega al PATH la ruta del directorio: MATLAB\demostraciones
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
objetivo = ['MATLAB' filesep 'demostraciones'];
toolboxes.addDirPath(objetivo)
